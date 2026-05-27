// ============================================================
// FILE    : lib/features/gear/data/models/checklist_item_model.dart
// FEATURE : Gear / Checklist
// PURPOSE : Dart data model for personal checklist items per mountain
// AUTHOR  : PuncakID Team
// ============================================================

import 'package:freezed_annotation/freezed_annotation.dart';

part 'checklist_item_model.freezed.dart';
part 'checklist_item_model.g.dart';

/// Checklist item data model mapped from the Laravel `checklist_items` table.
///
/// Fields sourced from `2026_04_27_060008_create_checklist_items_table.php`.
/// Each item belongs to a user and a mountain.
@freezed
abstract class ChecklistItemModel with _$ChecklistItemModel {
  const factory ChecklistItemModel({
    required int id,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'mountain_id') required int mountainId,
    required String name,
    @JsonKey(name: 'is_checked') @Default(false) bool isChecked,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _ChecklistItemModel;

  factory ChecklistItemModel.fromJson(Map<String, dynamic> json) =>
      _$ChecklistItemModelFromJson(json);
}
