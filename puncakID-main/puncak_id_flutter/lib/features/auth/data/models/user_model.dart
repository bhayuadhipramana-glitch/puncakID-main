// ============================================================
// FILE    : lib/features/auth/data/models/user_model.dart
// FEATURE : Auth
// PURPOSE : Dart data model for User, mapped from Laravel User.php
// AUTHOR  : PuncakID Team
// ============================================================

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

/// User data model mapped from the Laravel `users` table.
///
/// Fields sourced from:
/// - `0001_01_01_000000_create_users_table.php` (id, name, email)
/// - `2026_04_27_060010_add_profile_fields_to_users_table.php`
///   (nickname, bio, avatar_url, is_admin)
@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required int id,
    required String name,
    String? nickname,
    required String email,
    String? bio,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'is_admin') @Default(false) bool isAdmin,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

/// Login/Register API response containing both user data and token.
@freezed
abstract class AuthResponse with _$AuthResponse {
  const factory AuthResponse({
    required UserModel user,
    required String token,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
}
