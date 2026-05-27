// ============================================================
// FILE    : lib/features/mountains/data/models/first_aid_item_model.dart
// FEATURE : Mountains
// PURPOSE : Dart data model for FirstAidItem (per-mountain)
// AUTHOR  : PuncakID Team
// ============================================================

import 'package:freezed_annotation/freezed_annotation.dart';

part 'first_aid_item_model.freezed.dart';
part 'first_aid_item_model.g.dart';

/// First aid item data model mapped from the Laravel
/// `first_aid_items` table.
///
/// Fields sourced from `2026_04_27_060003_create_first_aid_items_table.php`.
@freezed
abstract class FirstAidItemModel with _$FirstAidItemModel {
  const factory FirstAidItemModel({
    required int id,
    @JsonKey(name: 'mountain_id') required int mountainId,
    required String name,
    @JsonKey(name: 'sort_order') @Default(0) int sortOrder,
  }) = _FirstAidItemModel;

  factory FirstAidItemModel.fromJson(Map<String, dynamic> json) =>
      _$FirstAidItemModelFromJson(json);
}
