// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PhotoModel _$PhotoModelFromJson(Map<String, dynamic> json) => _PhotoModel(
  id: (json['id'] as num).toInt(),
  userId: (json['user_id'] as num).toInt(),
  mountainId: (json['mountain_id'] as num).toInt(),
  imageUrl: json['image_url'] as String,
  caption: json['caption'] as String?,
  user: json['user'] == null
      ? null
      : UserModel.fromJson(json['user'] as Map<String, dynamic>),
  mountain: json['mountain'] == null
      ? null
      : MountainModel.fromJson(json['mountain'] as Map<String, dynamic>),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$PhotoModelToJson(_PhotoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'mountain_id': instance.mountainId,
      'image_url': instance.imageUrl,
      'caption': instance.caption,
      'user': instance.user,
      'mountain': instance.mountain,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
