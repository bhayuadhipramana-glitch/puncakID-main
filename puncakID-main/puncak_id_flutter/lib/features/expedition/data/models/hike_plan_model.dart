// ============================================================
// FILE    : lib/features/expedition/data/models/hike_plan_model.dart
// FEATURE : Expedition / Buddy Finder
// PURPOSE : Dart data model for HikePlan with user/mountain relations
// AUTHOR  : PuncakID Team
// ============================================================

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../auth/data/models/user_model.dart';
import '../../../mountains/data/models/mountain_model.dart';

part 'hike_plan_model.freezed.dart';
part 'hike_plan_model.g.dart';

/// Hike plan data model mapped from the Laravel `hike_plans` table.
///
/// Fields sourced from `2026_04_27_060005_create_hike_plans_table.php`.
/// Used both in PlanExpeditionScreen (create) and BuddyFinderScreen (list).
@freezed
abstract class HikePlanModel with _$HikePlanModel {
  const factory HikePlanModel({
    required int id,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'mountain_id') required int mountainId,
    @JsonKey(name: 'hike_date') required DateTime hikeDate,
    @JsonKey(name: 'arrival_time') required String arrivalTime,
    @JsonKey(name: 'route_via') required String routeVia,
    @JsonKey(name: 'num_people') @Default(1) int numPeople,
    @JsonKey(name: 'social_platform') @Default('whatsapp') String socialPlatform,
    @JsonKey(name: 'social_contact') required String socialContact,
    UserModel? user,
    MountainModel? mountain,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _HikePlanModel;

  factory HikePlanModel.fromJson(Map<String, dynamic> json) =>
      _$HikePlanModelFromJson(json);
}
