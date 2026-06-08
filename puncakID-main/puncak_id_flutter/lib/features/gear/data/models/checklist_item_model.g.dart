// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checklist_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChecklistItemModel _$ChecklistItemModelFromJson(Map<String, dynamic> json) =>
    _ChecklistItemModel(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      mountainId: (json['mountain_id'] as num).toInt(),
      name: json['name'] as String,
      isChecked: json['is_checked'] as bool? ?? false,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ChecklistItemModelToJson(_ChecklistItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'mountain_id': instance.mountainId,
      'name': instance.name,
      'is_checked': instance.isChecked,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
