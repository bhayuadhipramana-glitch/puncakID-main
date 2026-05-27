// ============================================================
// FILE    : lib/core/network/api_exception.dart
// FEATURE : Core / Network
// PURPOSE : Custom exception types for API error handling
// AUTHOR  : PuncakID Team
// ============================================================

/// Custom exception class for all API-related errors.
///
/// Provides structured error data including HTTP status code,
/// user-friendly message, and field-level validation errors (422).
class ApiException implements Exception {
  /// HTTP status code (e.g. 401, 422, 500). Null for network errors.
  final int? statusCode;

  /// Human-readable error message.
  final String message;

  /// Field-level validation errors returned by Laravel for 422 responses.
  /// Keys are field names, values are lists of error messages.
  final Map<String, List<String>>? validationErrors;

  const ApiException({
    this.statusCode,
    required this.message,
    this.validationErrors,
  });

  /// Whether this is an authentication error (token expired / invalid).
  bool get isUnauthorized => statusCode == 401;

  /// Whether this is a validation error with field-level details.
  bool get isValidation => statusCode == 422;

  /// Whether this is a server-side error.
  bool get isServerError => statusCode != null && statusCode! >= 500;

  /// Whether this is a network connectivity error.
  bool get isNetworkError => statusCode == null;

  /// Get the first validation error message for a specific field.
  String? fieldError(String field) {
    return validationErrors?[field]?.firstOrNull;
  }

  @override
  String toString() => 'ApiException($statusCode): $message';
}
