// ============================================================
// FILE    : lib/features/gear/data/repositories/gear_repository.dart
// FEATURE : Gear
// PURPOSE : Repository for checklist and gear wishlist API calls
// AUTHOR  : PuncakID Team
// ============================================================

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/dio_client.dart';
import '../models/checklist_item_model.dart';
import '../models/gear_wishlist_model.dart';

/// Provider for [GearRepository].
final gearRepositoryProvider = Provider<GearRepository>((ref) {
  return GearRepository(dio: ref.read(dioProvider));
});

/// Handles checklist and gear wishlist API interactions.
///
/// Endpoints mapped from GearTracker.jsx and AddGearTabungan.jsx.
class GearRepository {
  final Dio _dio;

  GearRepository({required Dio dio}) : _dio = dio;

  // ── Checklist ───────────────────────────────────────────────

  /// Fetch checklist items for a specific mountain.
  Future<List<ChecklistItemModel>> getChecklist(int mountainId) async {
    try {
      final response = await _dio.get(ApiConstants.kChecklist(mountainId));
      final data = response.data;
      if (data is List) {
        return data
            .map((j) => ChecklistItemModel.fromJson(j as Map<String, dynamic>))
            .toList();
      }
      return [];
    } on DioException catch (e) {
      throw extractApiException(e);
    }
  }

  /// Add a new checklist item.
  Future<ChecklistItemModel> addChecklistItem({
    required int mountainId,
    required String name,
  }) async {
    try {
      final response = await _dio.post(
        ApiConstants.kChecklistStore,
        data: {'mountain_id': mountainId, 'name': name},
      );
      return ChecklistItemModel.fromJson(response.data);
    } on DioException catch (e) {
      throw extractApiException(e);
    }
  }

  /// Toggle a checklist item's checked state.
  Future<ChecklistItemModel> updateChecklistItem({
    required int itemId,
    required bool isChecked,
  }) async {
    try {
      final response = await _dio.put(
        ApiConstants.kChecklistItem(itemId),
        data: {'is_checked': isChecked},
      );
      return ChecklistItemModel.fromJson(response.data);
    } on DioException catch (e) {
      throw extractApiException(e);
    }
  }

  /// Delete a checklist item.
  Future<void> deleteChecklistItem(int itemId) async {
    try {
      await _dio.delete(ApiConstants.kChecklistItem(itemId));
    } on DioException catch (e) {
      throw extractApiException(e);
    }
  }

  // ── Gear Wishlists ──────────────────────────────────────────

  /// Fetch all gear wishlist items for the current user.
  Future<List<GearWishlistModel>> getWishlists() async {
    try {
      final response = await _dio.get(ApiConstants.kGearWishlists);
      final data = response.data;
      if (data is List) {
        return data
            .map((j) => GearWishlistModel.fromJson(j as Map<String, dynamic>))
            .toList();
      }
      return [];
    } on DioException catch (e) {
      throw extractApiException(e);
    }
  }

  /// Fetch gear wishlist summary (totals).
  Future<Map<String, dynamic>> getWishlistSummary() async {
    try {
      final response = await _dio.get(ApiConstants.kGearWishlistsSummary);
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      throw extractApiException(e);
    }
  }

  /// Create a new gear wishlist item.
  Future<GearWishlistModel> createWishlist({
    required String name,
    String? imageUrl,
    required int targetPrice,
    int savedAmount = 0,
    String? storeLink,
    String frequency = 'daily',
    String? targetDate,
  }) async {
    try {
      final response = await _dio.post(
        ApiConstants.kGearWishlists,
        data: {
          'name': name,
          if (imageUrl != null) 'image_url': imageUrl,
          'target_price': targetPrice,
          'saved_amount': savedAmount,
          if (storeLink != null) 'store_link': storeLink,
          'frequency': frequency,
          if (targetDate != null) 'target_date': targetDate,
        },
      );
      return GearWishlistModel.fromJson(response.data);
    } on DioException catch (e) {
      throw extractApiException(e);
    }
  }

  /// Update an existing gear wishlist item.
  Future<GearWishlistModel> updateWishlist({
    required int id,
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await _dio.put(
        ApiConstants.kGearWishlistItem(id),
        data: data,
      );
      return GearWishlistModel.fromJson(response.data);
    } on DioException catch (e) {
      throw extractApiException(e);
    }
  }

  /// Delete a gear wishlist item.
  Future<void> deleteWishlist(int id) async {
    try {
      await _dio.delete(ApiConstants.kGearWishlistItem(id));
    } on DioException catch (e) {
      throw extractApiException(e);
    }
  }
}
