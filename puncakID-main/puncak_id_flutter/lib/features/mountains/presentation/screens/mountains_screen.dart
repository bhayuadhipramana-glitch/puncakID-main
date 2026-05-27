// ============================================================
// FILE    : lib/features/mountains/presentation/screens/mountains_screen.dart
// FEATURE : Mountains
// PURPOSE : Mountain list grid with search, altitude, and sort filters
// AUTHOR  : PuncakID Team
// ============================================================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../shared/widgets/error_view.dart';
import '../../../../shared/widgets/loading_overlay.dart';
import '../../domain/providers/mountain_provider.dart';

/// Mountains list screen with search and filter capabilities.
///
/// Converted from Mountains.jsx — card grid with altitude filter,
/// sort dropdown, difficulty badges, and status indicators.
class MountainsScreen extends ConsumerWidget {
  const MountainsScreen({super.key});

  Color _difficultyColor(String difficulty) {
    switch (difficulty) {
      case 'hard':
        return AppConstants.kRed500;
      case 'moderate':
        return AppConstants.kAmber500;
      default:
        return AppConstants.kEmerald500;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mountainsAsync = ref.watch(mountainListProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Search Bar ──────────────────────────────────
            Padding(
              padding: const EdgeInsets.all(AppConstants.kSpaceMd),
              child: TextField(
                onChanged: (v) =>
                    ref.read(mountainSearchProvider.notifier).state = v,
                decoration: InputDecoration(
                  hintText: 'Search mountains, peaks, or trails...',
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

            // ── Header & Filters ────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.kSpaceMd,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'REGISTRY',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: AppConstants.kAmber500,
                          letterSpacing: 3,
                        ),
                  ),
                  const SizedBox(height: 4),
                  RichText(
                    text: TextSpan(
                      style:
                          Theme.of(context).textTheme.headlineLarge?.copyWith(
                                fontWeight: FontWeight.w900,
                              ),
                      children: const [
                        TextSpan(text: 'Mountain '),
                        TextSpan(
                          text: 'Wiki',
                          style: TextStyle(color: AppConstants.kEmerald500),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Explore the highest peaks across the archipelago in Bali.',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: AppConstants.kSpaceMd),

                  // Filter chips
                  Row(
                    children: [
                      _FilterChip(
                        label: 'Altitude',
                        options: const {
                          '': 'All',
                          '3000': '3000m+',
                          '2000': '2000m+',
                          '1500': '1500m+',
                        },
                        provider: mountainElevationFilterProvider,
                      ),
                      const SizedBox(width: 8),
                      _FilterChip(
                        label: 'Sort',
                        options: const {
                          '': 'Altitude',
                          'difficulty': 'Difficulty',
                        },
                        provider: mountainSortProvider,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppConstants.kSpaceMd),

            // ── Mountain Grid ───────────────────────────────
            Expanded(
              child: mountainsAsync.when(
                loading: () => const LoadingIndicator(),
                error: (e, _) => ErrorView(
                  message: e.toString(),
                  onRetry: () => ref.invalidate(mountainListProvider),
                ),
                data: (mountains) {
                  if (mountains.isEmpty) {
                    return const EmptyView(
                      message: 'No mountains found matching your search.',
                      icon: Icons.terrain_rounded,
                    );
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.kSpaceMd,
                    ),
                    itemCount: mountains.length,
                    itemBuilder: (context, index) {
                      final m = mountains[index];
                      return GestureDetector(
                        onTap: () => context.push('/mountains/${m.slug}'),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              AppConstants.kRadius2Xl,
                            ),
                            border: Border.all(color: AppConstants.kWhite05),
                            color: AppConstants.kSlate900,
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Image
                              SizedBox(
                                height: 200,
                                width: double.infinity,
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    if (m.imageUrl != null)
                                      CachedNetworkImage(
                                        imageUrl: m.imageUrl!,
                                        fit: BoxFit.cover,
                                        placeholder: (_, __) => Container(
                                          color: AppConstants.kSlate800,
                                        ),
                                        errorWidget: (_, __, ___) => Container(
                                          color: AppConstants.kSlate800,
                                          child: const Icon(
                                            Icons.terrain_rounded,
                                            size: 48,
                                            color: AppConstants.kSlate600,
                                          ),
                                        ),
                                      ),
                                    // Gradient overlay
                                    Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.transparent,
                                            AppConstants.kSlate950
                                                .withValues(alpha: 0.6),
                                          ],
                                        ),
                                      ),
                                    ),
                                    // Badges
                                    Positioned(
                                      top: 12,
                                      left: 12,
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical: 5,
                                            ),
                                            decoration: BoxDecoration(
                                              color: _difficultyColor(
                                                      m.difficulty)
                                                  .withValues(alpha: 0.2),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                AppConstants.kRadiusFull,
                                              ),
                                            ),
                                            child: Text(
                                              m.difficulty.toUpperCase(),
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w800,
                                                letterSpacing: 1.5,
                                                color: _difficultyColor(
                                                    m.difficulty),
                                              ),
                                            ),
                                          ),
                                          if (m.status == 'CLOSED') ...[
                                            const SizedBox(width: 6),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 10,
                                                vertical: 5,
                                              ),
                                              decoration: BoxDecoration(
                                                color: AppConstants.kRed500
                                                    .withValues(alpha: 0.2),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  AppConstants.kRadiusFull,
                                                ),
                                              ),
                                              child: const Text(
                                                'CLOSED',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w800,
                                                  letterSpacing: 1.5,
                                                  color: AppConstants.kRed400,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Info
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            m.name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge,
                                          ),
                                          const SizedBox(height: 4),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.location_on_outlined,
                                                size: 14,
                                                color: AppConstants.kSlate500,
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                m.region,
                                                style: const TextStyle(
                                                  fontSize: 11,
                                                  color: AppConstants.kSlate500,
                                                  letterSpacing: 0.5,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          m.elevation.toString(),
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w900,
                                            color: AppConstants.kAmber500,
                                          ),
                                        ),
                                        const Text(
                                          'MDPL',
                                          style: TextStyle(
                                            fontSize: 9,
                                            color: AppConstants.kSlate500,
                                            letterSpacing: -0.5,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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

/// Reusable filter chip dropdown for mountain filters.
class _FilterChip extends ConsumerWidget {
  final String label;
  final Map<String, String> options;
  final StateProvider<String> provider;

  const _FilterChip({
    required this.label,
    required this.options,
    required this.provider,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final current = ref.watch(provider);
    final currentLabel = options[current] ?? options.values.first;

    return PopupMenuButton<String>(
      onSelected: (v) => ref.read(provider.notifier).state = v,
      offset: const Offset(0, 40),
      color: AppConstants.kSlate800,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.kRadiusMd),
      ),
      itemBuilder: (context) => options.entries
          .map(
            (e) => PopupMenuItem(
              value: e.key,
              child: Text(
                e.value,
                style: TextStyle(
                  color: current == e.key
                      ? AppConstants.kEmerald400
                      : AppConstants.kSlate300,
                  fontWeight:
                      current == e.key ? FontWeight.w700 : FontWeight.w400,
                ),
              ),
            ),
          )
          .toList(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: AppConstants.kSlate800.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(AppConstants.kRadiusMd),
          border: Border.all(color: AppConstants.kWhite05),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$label: ',
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
                color: AppConstants.kSlate500,
              ),
            ),
            Text(
              currentLabel,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppConstants.kEmerald400,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(
              Icons.expand_more_rounded,
              size: 16,
              color: AppConstants.kSlate500,
            ),
          ],
        ),
      ),
    );
  }
}
