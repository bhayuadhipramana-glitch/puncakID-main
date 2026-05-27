// ============================================================
// FILE    : lib/features/mountains/data/models/forum_thread_model.dart
// FEATURE : Mountains / Forum
// PURPOSE : Dart data model for forum discussion threads
// AUTHOR  : PuncakID Team
// ============================================================

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../auth/data/models/user_model.dart';

part 'forum_thread_model.freezed.dart';
part 'forum_thread_model.g.dart';

/// Forum thread data model mapped from the Laravel `forum_threads` table.
///
/// Fields sourced from `2026_04_27_060006_create_forum_threads_table.php`.
@freezed
abstract class ForumThreadModel with _$ForumThreadModel {
  const factory ForumThreadModel({
    required int id,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'mountain_id') required int mountainId,
    required String title,
    required String body,
    UserModel? user,
    @JsonKey(name: 'replies_count') int? repliesCount,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _ForumThreadModel;

  factory ForumThreadModel.fromJson(Map<String, dynamic> json) =>
      _$ForumThreadModelFromJson(json);
}
