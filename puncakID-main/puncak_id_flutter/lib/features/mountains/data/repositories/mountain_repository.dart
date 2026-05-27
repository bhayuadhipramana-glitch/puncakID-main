// ============================================================
// FILE    : lib/features/mountains/data/repositories/mountain_repository.dart
// FEATURE : Mountains
// PURPOSE : Repository for mountain-related API calls
// AUTHOR  : PuncakID Team
// ============================================================

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/dio_client.dart';
import '../models/mountain_model.dart';

/// Provider for [MountainRepository].
final mountainRepositoryProvider = Provider<MountainRepository>((ref) {
  return MountainRepository(dio: ref.read(dioProvider));
});

/// Handles all mountain-related API interactions.
///
/// Endpoints mapped from Mountains.jsx and MountainDetail.jsx API calls.
class MountainRepository {
  final Dio _dio;

  MountainRepository({required Dio dio}) : _dio = dio;

  /// Fetch list of all mountains with optional filters.
  ///
  /// Mirrors: `api.get('/mountains', { params })` from Mountains.jsx
  Future<List<MountainModel>> getMountains({
    String? search,
    String? minElevation,
    String? sort,
  }) async {
    try {
      final queryParams = <String, dynamic>{};
      if (search != null && search.isNotEmpty) queryParams['search'] = search;
      if (minElevation != null && minElevation.isNotEmpty) {
        queryParams['min_elevation'] = minElevation;
      }
      if (sort != null && sort.isNotEmpty) queryParams['sort'] = sort;

      final response = await _dio.get(
        ApiConstants.kMountains,
        queryParameters: queryParams,
      );

      final data = response.data;
      if (data is List) {
        return data
            .map((json) => MountainModel.fromJson(json as Map<String, dynamic>))
            .toList();
      }
      return [];
    } on DioException catch (e) {
      throw extractApiException(e);
    }
  }

  /// Fetch a single mountain by slug with all nested relations.
  ///
  /// Mirrors: `api.get('/mountains/${slug}')` from MountainDetail.jsx
  Future<MountainModel> getMountain(String slug) async {
    try {
      final response = await _dio.get(ApiConstants.kMountainDetail(slug));
      return MountainModel.fromJson(response.data);
    } on DioException catch (e) {
      throw extractApiException(e);
    }
  }

  /// Fetch other mountains (excluding the current one).
  ///
  /// Mirrors: `api.get('/mountains/${slug}/others')` from MountainDetail.jsx
  Future<List<MountainModel>> getOtherMountains(String slug) async {
    try {
      final response = await _dio.get(ApiConstants.kMountainOthers(slug));
      final data = response.data;
      if (data is List) {
        return data
            .map((json) => MountainModel.fromJson(json as Map<String, dynamic>))
            .toList();
      }
      return [];
    } on DioException catch (e) {
      throw extractApiException(e);
    }
  }
}
