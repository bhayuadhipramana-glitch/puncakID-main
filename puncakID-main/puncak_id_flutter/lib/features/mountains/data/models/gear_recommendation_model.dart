// ============================================================
// FILE    : lib/features/mountains/data/models/gear_recommendation_model.dart
// FEATURE : Mountains
// PURPOSE : Dart data model for GearRecommendation (per-mountain)
// AUTHOR  : PuncakID Team
// ============================================================

import 'package:freezed_annotation/freezed_annotation.dart';

part 'gear_recommendation_model.freezed.dart';
part 'gear_recommendation_model.g.dart';

/// Gear recommendation data model mapped from the Laravel
/// `gear_recommendations` table.
///
/// Fields sourced from `2026_04_27_060002_create_gear_recommendations_table.php`.
@freezed
abstract class GearRecommendationModel with _$GearRecommendationModel {
  const factory GearRecommendationModel({
    required int id,
    @JsonKey(name: 'mountain_id') required int mountainId,
    required String name,
    @JsonKey(name: 'sort_order') @Default(0) int sortOrder,
  }) = _GearRecommendationModel;

  factory GearRecommendationModel.fromJson(Map<String, dynamic> json) =>
      _$GearRecommendationModelFromJson(json);
}
