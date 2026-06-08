// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gear_wishlist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GearWishlistModel _$GearWishlistModelFromJson(Map<String, dynamic> json) =>
    _GearWishlistModel(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      name: json['name'] as String,
      imageUrl: json['image_url'] as String?,
      targetPrice: (json['target_price'] as num?)?.toInt() ?? 0,
      savedAmount: (json['saved_amount'] as num?)?.toInt() ?? 0,
      storeLink: json['store_link'] as String?,
      frequency: json['frequency'] as String? ?? 'daily',
      status: json['status'] as String? ?? 'saving',
      targetDate: json['target_date'] == null
          ? null
          : DateTime.parse(json['target_date'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$GearWishlistModelToJson(_GearWishlistModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'name': instance.name,
      'image_url': instance.imageUrl,
      'target_price': instance.targetPrice,
      'saved_amount': instance.savedAmount,
      'store_link': instance.storeLink,
      'frequency': instance.frequency,
      'status': instance.status,
      'target_date': instance.targetDate?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
