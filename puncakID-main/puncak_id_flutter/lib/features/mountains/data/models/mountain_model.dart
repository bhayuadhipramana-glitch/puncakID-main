// ============================================================
// FILE    : lib/features/mountains/data/models/mountain_model.dart
// FEATURE : Mountains
// PURPOSE : Dart data model for Mountain with nested relations
// AUTHOR  : PuncakID Team
// ============================================================

import 'package:freezed_annotation/freezed_annotation.dart';

import 'trailhead_model.dart';
import 'gear_recommendation_model.dart';
import 'first_aid_item_model.dart';

part 'mountain_model.freezed.dart';
part 'mountain_model.g.dart';

/// Mountain data model mapped from the Laravel `mountains` table.
///
/// Fields sourced from `2026_04_27_060000_create_mountains_table.php`.
/// Includes optional nested relations (trailheads, gear, first aid)
/// that are eager-loaded by the show endpoint.
@freezed
abstract class MountainModel with _$MountainModel {
  const factory MountainModel({
    required int id,
    required String slug,
    required String name,
    @Default('Bali, Indonesia') String region,
    required int elevation,
    @Default('moderate') String difficulty,
    String? description,
    @JsonKey(name: 'image_url') String? imageUrl,
    @Default('OPEN') String status,
    @JsonKey(name: 'fee_wni') @Default('Rp 50.000') String feeWni,
    @JsonKey(name: 'fee_wna') @Default('Rp 150.000') String feeWna,
    @JsonKey(name: 'avenza_map_url') String? avenzaMapUrl,
    List<TrailheadModel>? trailheads,
    @JsonKey(name: 'gear_recommendations')
    List<GearRecommendationModel>? gearRecommendations,
    @JsonKey(name: 'first_aid_items')
    List<FirstAidItemModel>? firstAidItems,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _MountainModel;

  factory MountainModel.fromJson(Map<String, dynamic> json) =>
      _$MountainModelFromJson(json);
}
