// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trailhead_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrailheadModel _$TrailheadModelFromJson(Map<String, dynamic> json) =>
    _TrailheadModel(
      id: (json['id'] as num).toInt(),
      mountainId: (json['mountain_id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
      googleMapsLink: json['google_maps_link'] as String?,
      avenzaPdfUrl: json['avenza_pdf_url'] as String?,
      sortOrder: (json['sort_order'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$TrailheadModelToJson(_TrailheadModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mountain_id': instance.mountainId,
      'name': instance.name,
      'description': instance.description,
      'google_maps_link': instance.googleMapsLink,
      'avenza_pdf_url': instance.avenzaPdfUrl,
      'sort_order': instance.sortOrder,
    };
