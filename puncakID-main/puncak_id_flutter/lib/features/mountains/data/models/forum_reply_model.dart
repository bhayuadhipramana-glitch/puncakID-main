// ============================================================
// FILE    : lib/features/mountains/data/models/forum_reply_model.dart
// FEATURE : Mountains / Forum
// PURPOSE : Dart data model for forum thread replies
// AUTHOR  : PuncakID Team
// ============================================================

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../auth/data/models/user_model.dart';

part 'forum_reply_model.freezed.dart';
part 'forum_reply_model.g.dart';

/// Forum reply data model mapped from the Laravel `forum_replies` table.
///
/// Fields sourced from `2026_04_27_060007_create_forum_replies_table.php`.
@freezed
abstract class ForumReplyModel with _$ForumReplyModel {
  const factory ForumReplyModel({
    required int id,
    @JsonKey(name: 'forum_thread_id') required int forumThreadId,
    @JsonKey(name: 'user_id') required int userId,
    required String body,
    UserModel? user,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _ForumReplyModel;

  factory ForumReplyModel.fromJson(Map<String, dynamic> json) =>
      _$ForumReplyModelFromJson(json);
}
