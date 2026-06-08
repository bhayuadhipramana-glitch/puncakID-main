// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hike_plan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HikePlanModel _$HikePlanModelFromJson(Map<String, dynamic> json) =>
    _HikePlanModel(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      mountainId: (json['mountain_id'] as num).toInt(),
      hikeDate: DateTime.parse(json['hike_date'] as String),
      arrivalTime: json['arrival_time'] as String,
      routeVia: json['route_via'] as String,
      numPeople: (json['num_people'] as num?)?.toInt() ?? 1,
      socialPlatform: json['social_platform'] as String? ?? 'whatsapp',
      socialContact: json['social_contact'] as String,
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

Map<String, dynamic> _$HikePlanModelToJson(_HikePlanModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'mountain_id': instance.mountainId,
      'hike_date': instance.hikeDate.toIso8601String(),
      'arrival_time': instance.arrivalTime,
      'route_via': instance.routeVia,
      'num_people': instance.numPeople,
      'social_platform': instance.socialPlatform,
      'social_contact': instance.socialContact,
      'user': instance.user,
      'mountain': instance.mountain,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
