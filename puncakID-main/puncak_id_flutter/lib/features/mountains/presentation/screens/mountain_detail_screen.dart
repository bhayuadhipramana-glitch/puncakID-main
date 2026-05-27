// ============================================================
// FILE    : lib/features/mountains/presentation/screens/mountain_detail_screen.dart
// FEATURE : Mountains
// PURPOSE : Full mountain detail with trailheads, gear, first aid
// AUTHOR  : PuncakID Team
// ============================================================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../shared/widgets/error_view.dart';
import '../../../../shared/widgets/loading_overlay.dart';
import '../../domain/providers/mountain_provider.dart';

/// Mountain detail screen showing full info, trailheads, gear, and first aid.
///
/// Converted from MountainDetail.jsx.
class MountainDetailScreen extends ConsumerWidget {
  final String slug;
  const MountainDetailScreen({super.key, required this.slug});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(mountainDetailProvider(slug));

    return Scaffold(
      body: detailAsync.when(
        loading: () => const LoadingIndicator(),
        error: (e, _) => ErrorView(
          message: e.toString(),
          onRetry: () => ref.invalidate(mountainDetailProvider(slug)),
        ),
        data: (mountain) {
          return CustomScrollView(
            slivers: [
              // ── Hero Image ──────────────────────────────
              SliverAppBar(
                expandedHeight: 300,
                pinned: true,
                backgroundColor: AppConstants.kSlate950,
                leading: IconButton(
                  onPressed: () => context.pop(),
                  icon: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppConstants.kSlate950.withValues(alpha: 0.6),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.arrow_back_rounded, size: 20),
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      if (mountain.imageUrl != null)
                        CachedNetworkImage(
                          imageUrl: mountain.imageUrl!,
                          fit: BoxFit.cover,
                        ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              AppConstants.kSlate950.withValues(alpha: 0.8),
                              AppConstants.kSlate950,
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 16,
                        left: 16,
                        right: 16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: mountain.status == 'OPEN'
                                    ? AppConstants.kEmerald500
                                        .withValues(alpha: 0.2)
                                    : AppConstants.kRed500
                                        .withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(
                                  AppConstants.kRadiusFull,
                                ),
                              ),
                              child: Text(
                                mountain.status,
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w800,
                                  color: mountain.status == 'OPEN'
                                      ? AppConstants.kEmerald400
                                      : AppConstants.kRed400,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              mountain.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(fontSize: 32),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(Icons.location_on_outlined,
                                    size: 14, color: AppConstants.kSlate400),
                                const SizedBox(width: 4),
                                Text(mountain.region,
                                    style: const TextStyle(
                                        color: AppConstants.kSlate400,
                                        fontSize: 13)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ── Content ─────────────────────────────────
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(AppConstants.kSpaceMd),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Stats row
                      Row(
                        children: [
                          _StatCard(
                            label: 'Elevation',
                            value: '${mountain.elevation} MDPL',
                            icon: Icons.height_rounded,
                          ),
                          const SizedBox(width: 12),
                          _StatCard(
                            label: 'Difficulty',
                            value: AppConstants.kDifficultyLabels[
                                    mountain.difficulty] ??
                                mountain.difficulty,
                            icon: Icons.trending_up_rounded,
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          _StatCard(
                            label: 'Fee (WNI)',
                            value: mountain.feeWni,
                            icon: Icons.payments_outlined,
                          ),
                          const SizedBox(width: 12),
                          _StatCard(
                            label: 'Fee (WNA)',
                            value: mountain.feeWna,
                            icon: Icons.payments_outlined,
                          ),
                        ],
                      ),
                      const SizedBox(height: AppConstants.kSpaceLg),

                      // Description
                      if (mountain.description != null) ...[
                        Text('About',
                            style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(height: 8),
                        Text(mountain.description!,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.6)),
                        const SizedBox(height: AppConstants.kSpaceLg),
                      ],

                      // Action buttons
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () =>
                                  context.push('/mountains/$slug/plan'),
                              icon: const Icon(Icons.map_outlined, size: 18),
                              label: const Text('Plan Expedition'),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: () =>
                                  context.push('/mountains/$slug/forum'),
                              icon: const Icon(Icons.forum_outlined, size: 18),
                              label: const Text('Forum'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppConstants.kSpaceLg),

                      // Trailheads
                      if (mountain.trailheads != null &&
                          mountain.trailheads!.isNotEmpty) ...[
                        _SectionTitle(title: 'Trailheads'),
                        ...mountain.trailheads!.map(
                          (t) => Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: AppConstants.kSlate900,
                              borderRadius: BorderRadius.circular(
                                  AppConstants.kRadiusMd),
                              border:
                                  Border.all(color: AppConstants.kWhite05),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(t.name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: AppConstants.kSlate300)),
                                if (t.description != null)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: Text(t.description!,
                                        style: const TextStyle(
                                            fontSize: 12,
                                            color: AppConstants.kSlate500)),
                                  ),
                                if (t.googleMapsLink != null)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: GestureDetector(
                                      onTap: () => launchUrl(
                                          Uri.parse(t.googleMapsLink!)),
                                      child: const Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(Icons.map_outlined,
                                              size: 14,
                                              color:
                                                  AppConstants.kEmerald400),
                                          SizedBox(width: 4),
                                          Text('Open in Maps',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: AppConstants
                                                      .kEmerald400)),
                                        ],
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: AppConstants.kSpaceMd),
                      ],

                      // Gear Recommendations
                      if (mountain.gearRecommendations != null &&
                          mountain.gearRecommendations!.isNotEmpty) ...[
                        _SectionTitle(title: 'Gear Recommendations'),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: mountain.gearRecommendations!
                              .map((g) => Chip(
                                    avatar: const Icon(
                                        Icons.backpack_outlined,
                                        size: 16),
                                    label: Text(g.name),
                                  ))
                              .toList(),
                        ),
                        const SizedBox(height: AppConstants.kSpaceMd),
                      ],

                      // First Aid Items
                      if (mountain.firstAidItems != null &&
                          mountain.firstAidItems!.isNotEmpty) ...[
                        _SectionTitle(title: 'First Aid Kit'),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: mountain.firstAidItems!
                              .map((f) => Chip(
                                    avatar: const Icon(
                                        Icons.medical_services_outlined,
                                        size: 16),
                                    label: Text(f.name),
                                  ))
                              .toList(),
                        ),
                        const SizedBox(height: AppConstants.kSpace2Xl),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _StatCard({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppConstants.kSlate900,
          borderRadius: BorderRadius.circular(AppConstants.kRadiusMd),
          border: Border.all(color: AppConstants.kWhite05),
        ),
        child: Row(
          children: [
            Icon(icon, size: 20, color: AppConstants.kEmerald500),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: const TextStyle(
                        fontSize: 10, color: AppConstants.kSlate500)),
                Text(value,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppConstants.kSlate300)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(title, style: Theme.of(context).textTheme.titleLarge),
    );
  }
}
