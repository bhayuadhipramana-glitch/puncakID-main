// ============================================================
// FILE    : lib/features/buddy_finder/presentation/screens/buddy_finder_screen.dart
// FEATURE : Buddy Finder
// PURPOSE : Browse upcoming hike plans from other users
// AUTHOR  : PuncakID Team
// ============================================================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../shared/widgets/error_view.dart';
import '../../../../shared/widgets/loading_overlay.dart';
import '../../../expedition/domain/providers/expedition_provider.dart';

/// Buddy finder screen showing upcoming hike plans.
///
/// Converted from Buddy.jsx — list of hike plans with user info and contact.
class BuddyFinderScreen extends ConsumerWidget {
  const BuddyFinderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final plansAsync = ref.watch(hikePlanListProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppConstants.kSpaceMd),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('COMMUNITY',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: AppConstants.kAmber500,
                            letterSpacing: 3,
                          )),
                  const SizedBox(height: 4),
                  RichText(
                    text: TextSpan(
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(fontWeight: FontWeight.w900),
                      children: const [
                        TextSpan(text: 'Buddy '),
                        TextSpan(
                          text: 'Finder',
                          style: TextStyle(color: AppConstants.kEmerald500),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text('Find climbing partners for your next adventure.',
                      style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
            Expanded(
              child: plansAsync.when(
                loading: () => const LoadingIndicator(),
                error: (e, _) => ErrorView(
                  message: e.toString(),
                  onRetry: () => ref.invalidate(hikePlanListProvider),
                ),
                data: (plans) {
                  if (plans.isEmpty) {
                    return const EmptyView(
                      message: 'No hike plans yet.',
                      subtitle: 'Be the first to plan an expedition!',
                      icon: Icons.group_outlined,
                    );
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppConstants.kSpaceMd),
                    itemCount: plans.length,
                    itemBuilder: (context, i) {
                      final plan = plans[i];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppConstants.kSlate900,
                          borderRadius:
                              BorderRadius.circular(AppConstants.kRadiusLg),
                          border: Border.all(color: AppConstants.kWhite05),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // User + Mountain
                            Row(
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
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
                                      (plan.user?.name ?? 'U')[0],
                                      style: const TextStyle(
                                        color: AppConstants.kWhite,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        plan.user?.nickname ??
                                            plan.user?.name ??
                                            'Anonymous',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: AppConstants.kSlate300,
                                        ),
                                      ),
                                      Text(
                                        plan.mountain?.name ?? '',
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: AppConstants.kEmerald400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            // Details
                            Wrap(
                              spacing: 16,
                              runSpacing: 8,
                              children: [
                                _DetailChip(
                                  icon: Icons.calendar_today_rounded,
                                  text: DateFormat.yMMMd()
                                      .format(plan.hikeDate),
                                ),
                                _DetailChip(
                                  icon: Icons.access_time_rounded,
                                  text: plan.arrivalTime,
                                ),
                                _DetailChip(
                                  icon: Icons.route_rounded,
                                  text: plan.routeVia,
                                ),
                                _DetailChip(
                                  icon: Icons.group_outlined,
                                  text: '${plan.numPeople} people',
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            // Contact
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                color: AppConstants.kEmerald500
                                    .withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(
                                    AppConstants.kRadiusSm),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.chat_bubble_outline_rounded,
                                      size: 14,
                                      color: AppConstants.kEmerald400),
                                  const SizedBox(width: 6),
                                  Text(
                                    '${plan.socialPlatform}: ${plan.socialContact}',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: AppConstants.kEmerald400,
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

class _DetailChip extends StatelessWidget {
  final IconData icon;
  final String text;
  const _DetailChip({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: AppConstants.kSlate500),
        const SizedBox(width: 4),
        Text(text,
            style:
                const TextStyle(fontSize: 12, color: AppConstants.kSlate400)),
      ],
    );
  }
}
