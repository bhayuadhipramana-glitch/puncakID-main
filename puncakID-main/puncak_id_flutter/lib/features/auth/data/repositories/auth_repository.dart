// ============================================================
// FILE    : lib/features/auth/data/repositories/auth_repository.dart
// FEATURE : Auth
// PURPOSE : Repository for authentication API calls (login,
//           register, logout, getUser) with token persistence
// AUTHOR  : PuncakID Team
// ============================================================

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/dio_client.dart';
import '../models/user_model.dart';

/// Provider for [AuthRepository].
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(
    dio: ref.read(dioProvider),
    storage: ref.read(secureStorageProvider),
  );
});

/// Handles all authentication-related API interactions.
///
/// Converted from [AuthContext.jsx] methods: login, register, logout, getUser.
/// Token persistence uses [FlutterSecureStorage] instead of localStorage.
class AuthRepository {
  final Dio _dio;
  final FlutterSecureStorage _storage;

  AuthRepository({
    required Dio dio,
    required FlutterSecureStorage storage,
  })  : _dio = dio,
        _storage = storage;

  /// Authenticate user with email and password.
  ///
  /// Stores the Sanctum token in secure storage on success.
  /// Returns [AuthResponse] containing user data and token.
  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        ApiConstants.kLogin,
        data: {'email': email, 'password': password},
      );
      final authResponse = AuthResponse.fromJson(response.data);
      await _storage.write(key: kTokenKey, value: authResponse.token);
      return authResponse;
    } on DioException catch (e) {
      throw extractApiException(e);
    }
  }

  /// Register a new user account.
  ///
  /// Stores the Sanctum token in secure storage on success.
  /// Returns [AuthResponse] containing user data and token.
  Future<AuthResponse> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      final response = await _dio.post(
        ApiConstants.kRegister,
        data: {
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': passwordConfirmation,
        },
      );
      final authResponse = AuthResponse.fromJson(response.data);
      await _storage.write(key: kTokenKey, value: authResponse.token);
      return authResponse;
    } on DioException catch (e) {
      throw extractApiException(e);
    }
  }

  /// Logout the current user and delete the stored token.
  Future<void> logout() async {
    try {
      await _dio.post(ApiConstants.kLogout);
    } catch (_) {
      // Ignore server errors during logout — always clear local state
    } finally {
      await _storage.delete(key: kTokenKey);
    }
  }

  /// Fetch the currently authenticated user's data.
  ///
  /// Used on app startup to verify the stored token is still valid.
  Future<UserModel> getUser() async {
    try {
      final response = await _dio.get(ApiConstants.kUser);
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      throw extractApiException(e);
    }
  }

  /// Check whether a token exists in secure storage.
  Future<bool> hasToken() async {
    final token = await _storage.read(key: kTokenKey);
    return token != null && token.isNotEmpty;
  }
}
