// ============================================================
// FILE    : lib/features/dashboard/data/repositories/dashboard_repository.dart
// FEATURE : Dashboard
// PURPOSE : Repository for community photo feed API calls
// AUTHOR  : PuncakID Team
// ============================================================

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/dio_client.dart';
import '../../../mountains/data/models/photo_model.dart';

/// Provider for [DashboardRepository].
final dashboardRepositoryProvider = Provider<DashboardRepository>((ref) {
  return DashboardRepository(dio: ref.read(dioProvider));
});

/// Handles the community photo feed API.
///
/// Endpoint mapped from Dashboard.jsx `fetchPhotos()`.
class DashboardRepository {
  final Dio _dio;

  DashboardRepository({required Dio dio}) : _dio = dio;

  /// Fetch the community photo feed with optional search.
  Future<List<PhotoModel>> getPhotos({String? search}) async {
    try {
      final queryParams = <String, dynamic>{};
      if (search != null && search.isNotEmpty) queryParams['search'] = search;

      final response = await _dio.get(
        ApiConstants.kPhotos,
        queryParameters: queryParams,
      );

      // Laravel paginates with {data: [...]} wrapper
      final data = response.data;
      List<dynamic> items;
      if (data is Map<String, dynamic> && data.containsKey('data')) {
        items = data['data'] as List<dynamic>;
      } else if (data is List) {
        items = data;
      } else {
        return [];
      }

      return items
          .map((j) => PhotoModel.fromJson(j as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw extractApiException(e);
    }
  }
}
