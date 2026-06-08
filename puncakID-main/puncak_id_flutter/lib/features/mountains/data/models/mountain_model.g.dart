// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mountain_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MountainModel _$MountainModelFromJson(Map<String, dynamic> json) =>
    _MountainModel(
      id: (json['id'] as num).toInt(),
      slug: json['slug'] as String,
      name: json['name'] as String,
      region: json['region'] as String? ?? 'Bali, Indonesia',
      elevation: (json['elevation'] as num).toInt(),
      difficulty: json['difficulty'] as String? ?? 'moderate',
      description: json['description'] as String?,
      imageUrl: json['image_url'] as String?,
      status: json['status'] as String? ?? 'OPEN',
      feeWni: json['fee_wni'] as String? ?? 'Rp 50.000',
      feeWna: json['fee_wna'] as String? ?? 'Rp 150.000',
      avenzaMapUrl: json['avenza_map_url'] as String?,
      trailheads: (json['trailheads'] as List<dynamic>?)
          ?.map((e) => TrailheadModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      gearRecommendations: (json['gear_recommendations'] as List<dynamic>?)
          ?.map(
            (e) => GearRecommendationModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      firstAidItems: (json['first_aid_items'] as List<dynamic>?)
          ?.map((e) => FirstAidItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$MountainModelToJson(_MountainModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'name': instance.name,
      'region': instance.region,
      'elevation': instance.elevation,
      'difficulty': instance.difficulty,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'status': instance.status,
      'fee_wni': instance.feeWni,
      'fee_wna': instance.feeWna,
      'avenza_map_url': instance.avenzaMapUrl,
      'trailheads': instance.trailheads,
      'gear_recommendations': instance.gearRecommendations,
      'first_aid_items': instance.firstAidItems,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
