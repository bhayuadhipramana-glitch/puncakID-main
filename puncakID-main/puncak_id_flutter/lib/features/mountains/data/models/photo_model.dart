// ============================================================
// FILE    : lib/features/mountains/data/models/photo_model.dart
// FEATURE : Mountains / Dashboard
// PURPOSE : Dart data model for Photo with user/mountain relations
// AUTHOR  : PuncakID Team
// ============================================================

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../auth/data/models/user_model.dart';
import 'mountain_model.dart';

part 'photo_model.freezed.dart';
part 'photo_model.g.dart';

/// Photo data model mapped from the Laravel `photos` table.
///
/// Fields sourced from `2026_04_27_060004_create_photos_table.php`.
/// Includes optional nested user and mountain relations from the API.
@freezed
abstract class PhotoModel with _$PhotoModel {
  const factory PhotoModel({
    required int id,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'mountain_id') required int mountainId,
    @JsonKey(name: 'image_url') required String imageUrl,
    String? caption,
    UserModel? user,
    MountainModel? mountain,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _PhotoModel;

  factory PhotoModel.fromJson(Map<String, dynamic> json) =>
      _$PhotoModelFromJson(json);
}
