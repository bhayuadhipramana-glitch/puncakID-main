// ============================================================
// FILE    : lib/features/dashboard/presentation/screens/dashboard_screen.dart
// FEATURE : Dashboard
// PURPOSE : Community photo gallery feed with search
// AUTHOR  : PuncakID Team
// ============================================================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../shared/widgets/error_view.dart';
import '../../../../shared/widgets/loading_overlay.dart';
import '../../../auth/domain/providers/auth_provider.dart';
import '../../domain/providers/dashboard_provider.dart';

/// Dashboard screen showing the community photo gallery.
///
/// Converted from Dashboard.jsx — photo grid with search and user attribution.
class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateProvider).valueOrNull;
    final photosAsync = ref.watch(photoFeedProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // ── Search Bar ──────────────────────────────────
            Padding(
              padding: const EdgeInsets.all(AppConstants.kSpaceMd),
              child: TextField(
                onChanged: (v) =>
                    ref.read(photoSearchProvider.notifier).state = v,
                decoration: InputDecoration(
                  hintText: 'Search Mountains...',
                  prefixIcon: const Icon(Icons.search_rounded, size: 20),
                  filled: true,
                  fillColor: AppConstants.kSlate800,
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(AppConstants.kRadiusFull),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                ),
                style: const TextStyle(fontSize: 14),
              ),
            ),

            // ── Section Header ──────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.kSpaceMd,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (user != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        'Welcome, ${user.nickname ?? user.name}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  Text(
                    'FEED',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: AppConstants.kAmber500,
                          letterSpacing: 3,
                        ),
                  ),
                  const SizedBox(height: 4),
                  RichText(
                    text: TextSpan(
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.w900,
                              ),
                      children: const [
                        TextSpan(text: 'Community '),
                        TextSpan(
                          text: 'Gallery',
                          style: TextStyle(color: AppConstants.kEmerald500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppConstants.kSpaceMd),

            // ── Photo Grid ──────────────────────────────────
            Expanded(
              child: photosAsync.when(
                loading: () => const LoadingIndicator(),
                error: (e, _) => ErrorView(
                  message: e.toString(),
                  onRetry: () => ref.invalidate(photoFeedProvider),
                ),
                data: (photos) {
                  if (photos.isEmpty) {
                    return const EmptyView(
                      message: 'No photos yet.',
                      subtitle: 'Be the first to share your climb!',
                      icon: Icons.photo_library_outlined,
                    );
                  }

                  return GridView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.kSpaceMd,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: photos.length,
                    itemBuilder: (context, index) {
                      final photo = photos[index];
                      // Build full image URL
                      final imageUrl = photo.imageUrl.startsWith('http')
                          ? photo.imageUrl
                          : '${ApiConstants.kBaseUrl.replaceAll('/api', '')}${photo.imageUrl}';

                      return Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(AppConstants.kRadiusLg),
                          border: Border.all(
                            color: AppConstants.kWhite05,
                          ),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Photo image
                            Expanded(
                              child: CachedNetworkImage(
                                imageUrl: imageUrl,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                placeholder: (_, __) => Container(
                                  color: AppConstants.kSlate800,
                                  child: const Center(
                                    child: Icon(
                                      Icons.image_outlined,
                                      color: AppConstants.kSlate600,
                                    ),
                                  ),
                                ),
                                errorWidget: (_, __, ___) => Container(
                                  color: AppConstants.kSlate800,
                                  child: const Center(
                                    child: Icon(Icons.broken_image_outlined,
                                        color: AppConstants.kSlate600),
                                  ),
                                ),
                              ),
                            ),
                            // Attribution
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  // Avatar circle
                                  Container(
                                    width: 24,
                                    height: 24,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                        colors: [
                                          AppConstants.kEmerald500,
                                          AppConstants.kAmber500,
                                        ],
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        (photo.user?.name ?? 'U')[0],
                                        style: const TextStyle(
                                          color: AppConstants.kWhite,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          photo.user?.nickname ??
                                              photo.user?.name ??
                                              '',
                                          style: const TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w600,
                                            color: AppConstants.kSlate300,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        if (photo.mountain?.name != null)
                                          Text(
                                            photo.mountain!.name,
                                            style: const TextStyle(
                                              fontSize: 9,
                                              color: AppConstants.kSlate500,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
