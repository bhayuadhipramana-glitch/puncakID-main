// ============================================================
// FILE    : lib/features/profile/data/repositories/profile_repository.dart
// FEATURE : Profile
// PURPOSE : Repository for profile, photo upload, and password APIs
// AUTHOR  : PuncakID Team
// ============================================================

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/dio_client.dart';
import '../../../mountains/data/models/photo_model.dart';

/// Provider for [ProfileRepository].
final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return ProfileRepository(dio: ref.read(dioProvider));
});

/// Handles profile, photo, and password management APIs.
///
/// Endpoints mapped from Profile.jsx and Settings.jsx API calls.
class ProfileRepository {
  final Dio _dio;

  ProfileRepository({required Dio dio}) : _dio = dio;

  /// Update user profile (multipart for avatar upload).
  Future<void> updateProfile({
    String? name,
    String? nickname,
    String? bio,
    String? avatarPath,
  }) async {
    try {
      final formData = FormData();
      if (name != null) formData.fields.add(MapEntry('name', name));
      if (nickname != null) formData.fields.add(MapEntry('nickname', nickname));
      if (bio != null) formData.fields.add(MapEntry('bio', bio));
      if (avatarPath != null) {
        formData.files.add(MapEntry(
          'avatar',
          await MultipartFile.fromFile(avatarPath, filename: 'avatar.jpg'),
        ));
      }
      await _dio.post(ApiConstants.kProfile, data: formData);
    } on DioException catch (e) {
      throw extractApiException(e);
    }
  }

  /// Update user password.
  Future<void> updatePassword({
    required String currentPassword,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      await _dio.put(
        ApiConstants.kProfilePassword,
        data: {
          'current_password': currentPassword,
          'password': password,
          'password_confirmation': passwordConfirmation,
        },
      );
    } on DioException catch (e) {
      throw extractApiException(e);
    }
  }

  /// Fetch photos for a specific user.
  Future<List<PhotoModel>> getUserPhotos(int userId) async {
    try {
      final response = await _dio.get(ApiConstants.kUserPhotos(userId));
      final data = response.data;
      if (data is List) {
        return data
            .map((j) => PhotoModel.fromJson(j as Map<String, dynamic>))
            .toList();
      }
      return [];
    } on DioException catch (e) {
      throw extractApiException(e);
    }
  }

  /// Upload a new photo (multipart).
  Future<PhotoModel> uploadPhoto({
    required int mountainId,
    required String imagePath,
    String? caption,
  }) async {
    try {
      final formData = FormData.fromMap({
        'mountain_id': mountainId,
        'image': await MultipartFile.fromFile(imagePath, filename: 'photo.jpg'),
        if (caption != null) 'caption': caption,
      });
      final response = await _dio.post(ApiConstants.kPhotos, data: formData);
      return PhotoModel.fromJson(response.data);
    } on DioException catch (e) {
      throw extractApiException(e);
    }
  }

  /// Delete a photo.
  Future<void> deletePhoto(int photoId) async {
    try {
      await _dio.delete(ApiConstants.kPhotoDelete(photoId));
    } on DioException catch (e) {
      throw extractApiException(e);
    }
  }
}
