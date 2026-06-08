// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum_reply_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ForumReplyModel _$ForumReplyModelFromJson(Map<String, dynamic> json) =>
    _ForumReplyModel(
      id: (json['id'] as num).toInt(),
      forumThreadId: (json['forum_thread_id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      body: json['body'] as String,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ForumReplyModelToJson(_ForumReplyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'forum_thread_id': instance.forumThreadId,
      'user_id': instance.userId,
      'body': instance.body,
      'user': instance.user,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
