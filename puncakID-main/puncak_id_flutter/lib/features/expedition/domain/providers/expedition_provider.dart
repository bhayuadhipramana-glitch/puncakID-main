// ============================================================
// FILE    : lib/features/expedition/domain/providers/expedition_provider.dart
// FEATURE : Expedition / Buddy Finder
// PURPOSE : Riverpod providers for hike plan state management
// AUTHOR  : PuncakID Team
// ============================================================

import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/hike_plan_model.dart';
import '../../data/repositories/expedition_repository.dart';

/// Provider for the list of all hike plans (buddy finder feed).
final hikePlanListProvider =
    AsyncNotifierProvider<HikePlanListNotifier, List<HikePlanModel>>(
  () => HikePlanListNotifier(),
);

class HikePlanListNotifier extends AsyncNotifier<List<HikePlanModel>> {
  @override
  Future<List<HikePlanModel>> build() async {
    final repository = ref.read(expeditionRepositoryProvider);
    return repository.getHikePlans();
  }

  /// Create a new hike plan and refresh the list.
  Future<HikePlanModel> createPlan({
    required int mountainId,
    required String hikeDate,
    required String arrivalTime,
    required String routeVia,
    required int numPeople,
    required String socialPlatform,
    required String socialContact,
  }) async {
    final repository = ref.read(expeditionRepositoryProvider);
    final plan = await repository.createHikePlan(
      mountainId: mountainId,
      hikeDate: hikeDate,
      arrivalTime: arrivalTime,
      routeVia: routeVia,
      numPeople: numPeople,
      socialPlatform: socialPlatform,
      socialContact: socialContact,
    );
    ref.invalidateSelf();
    return plan;
  }
}
