// ============================================================
// FILE    : lib/features/gear/domain/providers/gear_provider.dart
// FEATURE : Gear
// PURPOSE : Riverpod providers for checklist and gear wishlist state
// AUTHOR  : PuncakID Team
// ============================================================

import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/gear_wishlist_model.dart';
import '../../data/repositories/gear_repository.dart';

/// Gear wishlist list provider.
final gearWishlistProvider =
    AsyncNotifierProvider<GearWishlistNotifier, List<GearWishlistModel>>(
  () => GearWishlistNotifier(),
);

class GearWishlistNotifier extends AsyncNotifier<List<GearWishlistModel>> {
  @override
  Future<List<GearWishlistModel>> build() async {
    final repository = ref.read(gearRepositoryProvider);
    return repository.getWishlists();
  }

  /// Create a new wishlist item and refresh the list.
  Future<GearWishlistModel> create({
    required String name,
    String? imageUrl,
    required int targetPrice,
    int savedAmount = 0,
    String? storeLink,
    String frequency = 'daily',
    String? targetDate,
  }) async {
    final repository = ref.read(gearRepositoryProvider);
    final item = await repository.createWishlist(
      name: name,
      imageUrl: imageUrl,
      targetPrice: targetPrice,
      savedAmount: savedAmount,
      storeLink: storeLink,
      frequency: frequency,
      targetDate: targetDate,
    );
    ref.invalidateSelf();
    return item;
  }

  /// Update a wishlist item and refresh the list.
  Future<void> update({
    required int id,
    required Map<String, dynamic> data,
  }) async {
    final repository = ref.read(gearRepositoryProvider);
    await repository.updateWishlist(id: id, data: data);
    ref.invalidateSelf();
  }

  /// Delete a wishlist item and refresh the list.
  Future<void> delete(int id) async {
    final repository = ref.read(gearRepositoryProvider);
    await repository.deleteWishlist(id);
    ref.invalidateSelf();
  }
}

/// Gear wishlist summary provider (total saved, total target, etc.).
final gearSummaryProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final repository = ref.read(gearRepositoryProvider);
  return repository.getWishlistSummary();
});
