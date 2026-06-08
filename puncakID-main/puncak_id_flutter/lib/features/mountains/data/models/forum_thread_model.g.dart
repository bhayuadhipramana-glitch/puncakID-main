// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum_thread_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ForumThreadModel _$ForumThreadModelFromJson(Map<String, dynamic> json) =>
    _ForumThreadModel(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      mountainId: (json['mountain_id'] as num).toInt(),
      title: json['title'] as String,
      body: json['body'] as String,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      repliesCount: (json['replies_count'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ForumThreadModelToJson(_ForumThreadModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'mountain_id': instance.mountainId,
      'title': instance.title,
      'body': instance.body,
      'user': instance.user,
      'replies_count': instance.repliesCount,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
