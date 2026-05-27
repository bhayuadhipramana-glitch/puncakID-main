// ============================================================
// FILE    : lib/features/gear/data/models/gear_wishlist_model.dart
// FEATURE : Gear
// PURPOSE : Dart data model for gear savings wishlist with progress
// AUTHOR  : PuncakID Team
// ============================================================

import 'dart:math';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gear_wishlist_model.freezed.dart';
part 'gear_wishlist_model.g.dart';

/// Gear wishlist data model mapped from the Laravel `gear_wishlists` table.
///
/// Fields sourced from `2026_04_27_060009_create_gear_wishlists_table.php`.
/// Includes a computed [progressPercent] matching the Laravel accessor.
@freezed
abstract class GearWishlistModel with _$GearWishlistModel {
  const GearWishlistModel._();

  const factory GearWishlistModel({
    required int id,
    @JsonKey(name: 'user_id') required int userId,
    required String name,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'target_price') @Default(0) int targetPrice,
    @JsonKey(name: 'saved_amount') @Default(0) int savedAmount,
    @JsonKey(name: 'store_link') String? storeLink,
    @Default('daily') String frequency,
    @Default('saving') String status,
    @JsonKey(name: 'target_date') DateTime? targetDate,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _GearWishlistModel;

  /// Computed savings progress percentage, matching the Laravel
  /// `getProgressPercentAttribute()` accessor.
  int get progressPercent {
    if (targetPrice <= 0) return 0;
    return min(100, ((savedAmount / targetPrice) * 100).round());
  }

  /// Whether the savings goal has been reached.
  bool get isGoalReached => progressPercent >= 100;

  factory GearWishlistModel.fromJson(Map<String, dynamic> json) =>
      _$GearWishlistModelFromJson(json);
}
