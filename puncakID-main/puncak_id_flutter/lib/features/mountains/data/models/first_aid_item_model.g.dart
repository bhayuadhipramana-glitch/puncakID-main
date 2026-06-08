// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'first_aid_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FirstAidItemModel _$FirstAidItemModelFromJson(Map<String, dynamic> json) =>
    _FirstAidItemModel(
      id: (json['id'] as num).toInt(),
      mountainId: (json['mountain_id'] as num).toInt(),
      name: json['name'] as String,
      sortOrder: (json['sort_order'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$FirstAidItemModelToJson(_FirstAidItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mountain_id': instance.mountainId,
      'name': instance.name,
      'sort_order': instance.sortOrder,
    };
