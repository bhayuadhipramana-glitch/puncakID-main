// ============================================================
// FILE    : lib/features/profile/domain/providers/profile_provider.dart
// FEATURE : Profile
// PURPOSE : Riverpod providers for profile and user photos state
// AUTHOR  : PuncakID Team
// ============================================================

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../mountains/data/models/photo_model.dart';
import '../../data/repositories/profile_repository.dart';

/// User photos provider (family by userId).
final userPhotosProvider =
    FutureProvider.family<List<PhotoModel>, int>((ref, userId) async {
  final repository = ref.read(profileRepositoryProvider);
  return repository.getUserPhotos(userId);
});
