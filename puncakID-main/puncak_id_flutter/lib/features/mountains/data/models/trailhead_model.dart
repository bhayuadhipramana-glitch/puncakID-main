// ============================================================
// FILE    : lib/features/mountains/data/models/trailhead_model.dart
// FEATURE : Mountains
// PURPOSE : Dart data model for Trailhead (sub-resource of Mountain)
// AUTHOR  : PuncakID Team
// ============================================================

import 'package:freezed_annotation/freezed_annotation.dart';

part 'trailhead_model.freezed.dart';
part 'trailhead_model.g.dart';

/// Trailhead data model mapped from the Laravel `trailheads` table.
///
/// Fields sourced from `2026_04_27_060001_create_trailheads_table.php`.
@freezed
abstract class TrailheadModel with _$TrailheadModel {
  const factory TrailheadModel({
    required int id,
    @JsonKey(name: 'mountain_id') required int mountainId,
    required String name,
    String? description,
    @JsonKey(name: 'google_maps_link') String? googleMapsLink,
    @JsonKey(name: 'avenza_pdf_url') String? avenzaPdfUrl,
    @JsonKey(name: 'sort_order') @Default(0) int sortOrder,
  }) = _TrailheadModel;

  factory TrailheadModel.fromJson(Map<String, dynamic> json) =>
      _$TrailheadModelFromJson(json);
}
