// ============================================================
// FILE    : lib/features/mountains/domain/providers/mountain_provider.dart
// FEATURE : Mountains
// PURPOSE : Riverpod providers for mountain list and detail state
// AUTHOR  : PuncakID Team
// ============================================================

import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/mountain_model.dart';
import '../../data/repositories/mountain_repository.dart';

/// Search text state for mountain list filtering.
final mountainSearchProvider = StateProvider<String>((ref) => '');

/// Min elevation filter state.
final mountainElevationFilterProvider = StateProvider<String>((ref) => '');

/// Sort mode state.
final mountainSortProvider = StateProvider<String>((ref) => '');

/// Mountain list provider that reacts to filter/search changes.
///
/// Automatically refetches when search, elevation, or sort changes.
final mountainListProvider =
    AsyncNotifierProvider<MountainListNotifier, List<MountainModel>>(
  () => MountainListNotifier(),
);

class MountainListNotifier extends AsyncNotifier<List<MountainModel>> {
  @override
  Future<List<MountainModel>> build() async {
    final search = ref.watch(mountainSearchProvider);
    final elevation = ref.watch(mountainElevationFilterProvider);
    final sort = ref.watch(mountainSortProvider);
    final repository = ref.read(mountainRepositoryProvider);

    return repository.getMountains(
      search: search,
      minElevation: elevation,
      sort: sort,
    );
  }

  /// Force refresh the mountain list.
  Future<void> refresh() async {
    ref.invalidateSelf();
  }
}

/// Mountain detail provider — fetches full mountain data by slug.
///
/// Uses family pattern so each slug gets its own cached state.
final mountainDetailProvider = AsyncNotifierProvider.family<
    MountainDetailNotifier, MountainModel, String>(
  () => MountainDetailNotifier(),
);

class MountainDetailNotifier
    extends FamilyAsyncNotifier<MountainModel, String> {
  @override
  Future<MountainModel> build(String arg) async {
    final repository = ref.read(mountainRepositoryProvider);
    return repository.getMountain(arg);
  }
}

/// Other mountains provider (for "You might also like" section).
final otherMountainsProvider = FutureProvider.family<List<MountainModel>, String>(
  (ref, slug) async {
    final repository = ref.read(mountainRepositoryProvider);
    return repository.getOtherMountains(slug);
  },
);
