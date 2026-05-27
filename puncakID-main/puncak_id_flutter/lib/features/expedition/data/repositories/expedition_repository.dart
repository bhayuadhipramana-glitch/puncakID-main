// ============================================================
// FILE    : lib/features/expedition/data/repositories/expedition_repository.dart
// FEATURE : Expedition / Buddy Finder
// PURPOSE : Repository for hike plan API calls
// AUTHOR  : PuncakID Team
// ============================================================

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/dio_client.dart';
import '../models/hike_plan_model.dart';

/// Provider for [ExpeditionRepository].
final expeditionRepositoryProvider = Provider<ExpeditionRepository>((ref) {
  return ExpeditionRepository(dio: ref.read(dioProvider));
});

/// Handles hike plan creation and listing.
///
/// Endpoints mapped from PlanExpedition.jsx and Buddy.jsx API calls.
class ExpeditionRepository {
  final Dio _dio;

  ExpeditionRepository({required Dio dio}) : _dio = dio;

  /// Fetch all hike plans (public, for buddy finder).
  Future<List<HikePlanModel>> getHikePlans() async {
    try {
      final response = await _dio.get(ApiConstants.kHikePlans);
      final data = response.data;
      if (data is List) {
        return data
            .map((j) => HikePlanModel.fromJson(j as Map<String, dynamic>))
            .toList();
      }
      return [];
    } on DioException catch (e) {
      throw extractApiException(e);
    }
  }

  /// Fetch a single hike plan by ID.
  Future<HikePlanModel> getHikePlan(int id) async {
    try {
      final response = await _dio.get(ApiConstants.kHikePlanDetail(id));
      return HikePlanModel.fromJson(response.data);
    } on DioException catch (e) {
      throw extractApiException(e);
    }
  }

  /// Create a new hike plan.
  Future<HikePlanModel> createHikePlan({
    required int mountainId,
    required String hikeDate,
    required String arrivalTime,
    required String routeVia,
    required int numPeople,
    required String socialPlatform,
    required String socialContact,
  }) async {
    try {
      final response = await _dio.post(
        ApiConstants.kHikePlans,
        data: {
          'mountain_id': mountainId,
          'hike_date': hikeDate,
          'arrival_time': arrivalTime,
          'route_via': routeVia,
          'num_people': numPeople,
          'social_platform': socialPlatform,
          'social_contact': socialContact,
        },
      );
      return HikePlanModel.fromJson(response.data);
    } on DioException catch (e) {
      throw extractApiException(e);
    }
  }
}
