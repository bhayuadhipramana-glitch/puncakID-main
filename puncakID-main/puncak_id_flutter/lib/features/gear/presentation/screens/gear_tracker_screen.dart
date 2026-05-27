// ============================================================
// FILE    : lib/features/gear/presentation/screens/gear_tracker_screen.dart
// FEATURE : Gear
// PURPOSE : Gear wishlist with savings progress tracking
// AUTHOR  : PuncakID Team
// ============================================================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../shared/widgets/error_view.dart';
import '../../../../shared/widgets/loading_overlay.dart';
import '../../domain/providers/gear_provider.dart';

/// Gear tracker screen showing savings wishlist.
///
/// Converted from GearTracker.jsx.
class GearTrackerScreen extends ConsumerWidget {
  const GearTrackerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wishlistAsync = ref.watch(gearWishlistProvider);
    final formatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);

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
                  Text('TRACKER',
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
                        TextSpan(text: 'Gear '),
                        TextSpan(
                          text: 'Wishlist',
                          style: TextStyle(color: AppConstants.kEmerald500),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text('Track your gear savings goals.',
                      style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
            Expanded(
              child: wishlistAsync.when(
                loading: () => const LoadingIndicator(),
                error: (e, _) => ErrorView(
                  message: e.toString(),
                  onRetry: () => ref.invalidate(gearWishlistProvider),
                ),
                data: (items) {
                  if (items.isEmpty) {
                    return EmptyView(
                      message: 'No gear items yet.',
                      subtitle: 'Start tracking your dream gear!',
                      icon: Icons.backpack_outlined,
                      action: ElevatedButton.icon(
                        onPressed: () => context.push('/gear/add'),
                        icon: const Icon(Icons.add_rounded, size: 18),
                        label: const Text('Add Gear'),
                      ),
                    );
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppConstants.kSpaceMd),
                    itemCount: items.length,
                    itemBuilder: (context, i) {
                      final item = items[i];
                      return Dismissible(
                        key: ValueKey(item.id),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 16),
                          color: AppConstants.kRed500,
                          child: const Icon(Icons.delete_outline_rounded,
                              color: AppConstants.kWhite),
                        ),
                        confirmDismiss: (_) async {
                          return await showDialog<bool>(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: const Text('Delete Item'),
                              content: Text('Delete "${item.name}"?'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(ctx, false),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(ctx, true),
                                  child: const Text('Delete',
                                      style: TextStyle(
                                          color: AppConstants.kRed500)),
                                ),
                              ],
                            ),
                          );
                        },
                        onDismissed: (_) {
                          ref.read(gearWishlistProvider.notifier).delete(item.id);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppConstants.kSlate900,
                            borderRadius: BorderRadius.circular(
                                AppConstants.kRadiusLg),
                            border:
                                Border.all(color: AppConstants.kWhite05),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      item.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: AppConstants.kSlate300,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: item.status == 'collected'
                                          ? AppConstants.kEmerald500
                                              .withValues(alpha: 0.2)
                                          : AppConstants.kAmber500
                                              .withValues(alpha: 0.2),
                                      borderRadius: BorderRadius.circular(
                                          AppConstants.kRadiusFull),
                                    ),
                                    child: Text(
                                      item.status.toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w800,
                                        color: item.status == 'collected'
                                            ? AppConstants.kEmerald400
                                            : AppConstants.kAmber400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              // Progress bar
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: LinearProgressIndicator(
                                  value: item.progressPercent / 100,
                                  backgroundColor: AppConstants.kSlate800,
                                  valueColor:
                                      const AlwaysStoppedAnimation<Color>(
                                          AppConstants.kEmerald500),
                                  minHeight: 6,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${formatter.format(item.savedAmount)} / ${formatter.format(item.targetPrice)}',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: AppConstants.kSlate400,
                                    ),
                                  ),
                                  Text(
                                    '${item.progressPercent}%',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: AppConstants.kEmerald400,
                                    ),
                                  ),
                                ],
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/gear/add'),
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}
