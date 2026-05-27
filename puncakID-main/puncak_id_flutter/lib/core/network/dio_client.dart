// ============================================================
// FILE    : lib/core/network/dio_client.dart
// FEATURE : Core / Network
// PURPOSE : Singleton Dio HTTP client with Bearer token injection,
//           error interception, and debug logging
// AUTHOR  : PuncakID Team
// ============================================================

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../constants/api_constants.dart';
import 'api_exception.dart';

/// Secure storage key used to persist the Sanctum Bearer token.
const String kTokenKey = 'auth_token';

/// Provider for [FlutterSecureStorage] instance used across the app.
final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );
});

/// Provider for the configured [Dio] HTTP client singleton.
///
/// This is the ONLY Dio instance in the app. All repositories must
/// consume this provider to make API calls.
final dioProvider = Provider<Dio>((ref) {
  final storage = ref.read(secureStorageProvider);
  return createDioClient(storage);
});

/// Creates and configures a [Dio] instance with:
/// 1. BaseOptions targeting the Laravel API
/// 2. Request interceptor for Bearer token injection from SecureStorage
/// 3. Response/error interceptor for 401, 422, 500, and timeout handling
/// 4. LogInterceptor in debug mode only
Dio createDioClient(FlutterSecureStorage storage) {
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.kBaseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  // ── Request Interceptor: Inject Bearer Token ──────────────
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await storage.read(key: kTokenKey);
        if (token != null && token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        handler.next(options);
      },
      onError: (error, handler) async {
        final response = error.response;
        final statusCode = response?.statusCode;

        // ── 401 Unauthorized: Token expired / invalid ───────
        if (statusCode == 401) {
          await storage.delete(key: kTokenKey);
          handler.reject(
            DioException(
              requestOptions: error.requestOptions,
              error: const ApiException(
                statusCode: 401,
                message: 'Session expired. Please log in again.',
              ),
            ),
          );
          return;
        }

        // ── 422 Validation Error: Parse field-level errors ──
        if (statusCode == 422) {
          final data = response?.data;
          Map<String, List<String>>? validationErrors;
          String message = 'Validation failed.';

          if (data is Map<String, dynamic>) {
            message = data['message'] as String? ?? message;
            final errors = data['errors'];
            if (errors is Map<String, dynamic>) {
              validationErrors = errors.map(
                (key, value) => MapEntry(
                  key,
                  (value as List<dynamic>).cast<String>(),
                ),
              );
            }
          }

          handler.reject(
            DioException(
              requestOptions: error.requestOptions,
              error: ApiException(
                statusCode: 422,
                message: message,
                validationErrors: validationErrors,
              ),
            ),
          );
          return;
        }

        // ── 500+ Server Error ───────────────────────────────
        if (statusCode != null && statusCode >= 500) {
          handler.reject(
            DioException(
              requestOptions: error.requestOptions,
              error: ApiException(
                statusCode: statusCode,
                message: 'Server error. Please try again later.',
              ),
            ),
          );
          return;
        }

        // ── Timeout / Network Error ─────────────────────────
        if (error.type == DioExceptionType.connectionTimeout ||
            error.type == DioExceptionType.receiveTimeout ||
            error.type == DioExceptionType.sendTimeout ||
            error.type == DioExceptionType.connectionError) {
          handler.reject(
            DioException(
              requestOptions: error.requestOptions,
              error: const ApiException(
                message: 'No internet connection. Please check your network.',
              ),
            ),
          );
          return;
        }

        // ── Other errors: pass through ──────────────────────
        final msg = response?.data is Map
            ? (response?.data['message'] as String? ?? error.message ?? 'Unknown error')
            : (error.message ?? 'Unknown error');

        handler.reject(
          DioException(
            requestOptions: error.requestOptions,
            error: ApiException(
              statusCode: statusCode,
              message: msg,
            ),
          ),
        );
      },
    ),
  );

  // ── Debug Logging (only in debug mode) ────────────────────
  if (kDebugMode) {
    dio.interceptors.add(
      LogInterceptor(
        requestHeader: false,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
        error: true,
        logPrint: (object) => debugPrint('🌐 $object'),
      ),
    );
  }

  return dio;
}

/// Helper to extract [ApiException] from a [DioException].
///
/// Use this in repositories to convert Dio errors into typed exceptions:
/// ```dart
/// try { ... } on DioException catch (e) { throw extractApiException(e); }
/// ```
ApiException extractApiException(DioException e) {
  if (e.error is ApiException) {
    return e.error as ApiException;
  }
  return ApiException(
    statusCode: e.response?.statusCode,
    message: e.message ?? 'An unexpected error occurred.',
  );
}
