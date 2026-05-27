// ============================================================
// FILE    : lib/features/auth/domain/providers/auth_provider.dart
// FEATURE : Auth
// PURPOSE : Riverpod providers for authentication state management
// AUTHOR  : PuncakID Team
// ============================================================

import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/user_model.dart';
import '../../data/repositories/auth_repository.dart';

/// Main auth state provider.
///
/// Manages the currently authenticated [UserModel] (or null if logged out).
/// Replaces the React useAuth() context with Riverpod state management.
final authStateProvider =
    AsyncNotifierProvider<AuthNotifier, UserModel?>(() => AuthNotifier());

/// Derived provider: whether the user is currently logged in.
final isLoggedInProvider = Provider<bool>((ref) {
  return ref.watch(authStateProvider).valueOrNull != null;
});

/// Derived provider: whether the current user has admin privileges.
final isAdminProvider = Provider<bool>((ref) {
  return ref.watch(authStateProvider).valueOrNull?.isAdmin ?? false;
});

/// Auth state notifier handling login, register, logout, and token validation.
///
/// On initialization, checks for a stored token and validates it by
/// fetching the user profile — matching AuthContext.jsx's useEffect behavior.
class AuthNotifier extends AsyncNotifier<UserModel?> {
  late final AuthRepository _repository;

  @override
  Future<UserModel?> build() async {
    _repository = ref.read(authRepositoryProvider);

    // Check if a token exists and validate it (mirrors AuthContext useEffect)
    final hasToken = await _repository.hasToken();
    if (!hasToken) return null;

    try {
      return await _repository.getUser();
    } catch (_) {
      // Token is invalid or expired — clear it
      await _repository.logout();
      return null;
    }
  }

  /// Log in with email and password.
  ///
  /// On success, updates the auth state with the user data.
  /// Returns the [UserModel] for redirect logic (admin vs regular).
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final authResponse = await _repository.login(
      email: email,
      password: password,
    );
    state = AsyncData(authResponse.user);
    return authResponse.user;
  }

  /// Register a new account.
  ///
  /// On success, updates the auth state with the new user data.
  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    final authResponse = await _repository.register(
      name: name,
      email: email,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );
    state = AsyncData(authResponse.user);
    return authResponse.user;
  }

  /// Log out the current user.
  ///
  /// Clears the auth state and deletes the stored token.
  Future<void> logout() async {
    await _repository.logout();
    state = const AsyncData(null);
  }

  /// Refresh the current user's data from the API.
  ///
  /// Equivalent to refreshUser() in AuthContext.jsx.
  Future<void> refreshUser() async {
    try {
      final user = await _repository.getUser();
      state = AsyncData(user);
    } catch (_) {
      // Silently fail — keep existing state
    }
  }
}
