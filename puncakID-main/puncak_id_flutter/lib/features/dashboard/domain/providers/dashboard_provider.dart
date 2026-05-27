// ============================================================
// FILE    : lib/features/dashboard/domain/providers/dashboard_provider.dart
// FEATURE : Dashboard
// PURPOSE : Riverpod providers for community photo feed state
// AUTHOR  : PuncakID Team
// ============================================================

import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../mountains/data/models/photo_model.dart';
import '../../data/repositories/dashboard_repository.dart';

/// Search text state for the photo feed.
final photoSearchProvider = StateProvider<String>((ref) => '');

/// Community photo feed provider that reacts to search changes.
final photoFeedProvider =
    AsyncNotifierProvider<PhotoFeedNotifier, List<PhotoModel>>(
  () => PhotoFeedNotifier(),
);

class PhotoFeedNotifier extends AsyncNotifier<List<PhotoModel>> {
  @override
  Future<List<PhotoModel>> build() async {
    final search = ref.watch(photoSearchProvider);
    final repository = ref.read(dashboardRepositoryProvider);
    return repository.getPhotos(search: search);
  }
}
