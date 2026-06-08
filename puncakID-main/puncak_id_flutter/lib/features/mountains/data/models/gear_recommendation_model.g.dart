// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gear_recommendation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GearRecommendationModel _$GearRecommendationModelFromJson(
  Map<String, dynamic> json,
) => _GearRecommendationModel(
  id: (json['id'] as num).toInt(),
  mountainId: (json['mountain_id'] as num).toInt(),
  name: json['name'] as String,
  sortOrder: (json['sort_order'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$GearRecommendationModelToJson(
  _GearRecommendationModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'mountain_id': instance.mountainId,
  'name': instance.name,
  'sort_order': instance.sortOrder,
};
