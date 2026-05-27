// ============================================================
// FILE    : lib/features/admin/presentation/screens/admin_screen.dart
// FEATURE : Admin
// PURPOSE : Admin panel for mountain and resource management
// AUTHOR  : PuncakID Team
// ============================================================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../shared/widgets/error_view.dart';
import '../../../../shared/widgets/loading_overlay.dart';
import '../../../auth/domain/providers/auth_provider.dart';
import '../../../mountains/domain/providers/mountain_provider.dart';

/// Admin screen for mountain management.
///
/// Converted from AdminPage.jsx — simplified for mobile with
/// mountain list management.
class AdminScreen extends ConsumerWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mountainsAsync = ref.watch(mountainListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Panel'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.go('/dashboard'),
        ),
        actions: [
          TextButton.icon(
            onPressed: () async {
              await ref.read(authStateProvider.notifier).logout();
              if (context.mounted) context.go('/');
            },
            icon: const Icon(Icons.logout_rounded,
                size: 16, color: AppConstants.kRed400),
            label: const Text('Logout',
                style: TextStyle(color: AppConstants.kRed400)),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppConstants.kSpaceMd),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ADMIN',
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
                        TextSpan(text: 'Mountain '),
                        TextSpan(
                          text: 'Manager',
                          style: TextStyle(color: AppConstants.kEmerald500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
                      message: 'No mountains found.',
                      icon: Icons.terrain_rounded,
                    );
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppConstants.kSpaceMd),
                    itemCount: mountains.length,
                    itemBuilder: (context, i) {
                      final m = mountains[i];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(
                          color: AppConstants.kSlate900,
                          borderRadius:
                              BorderRadius.circular(AppConstants.kRadiusMd),
                          border: Border.all(color: AppConstants.kWhite05),
                        ),
                        child: ListTile(
                          leading: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppConstants.kEmerald500
                                  .withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(Icons.terrain_rounded,
                                color: AppConstants.kEmerald500, size: 20),
                          ),
                          title: Text(m.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: AppConstants.kSlate300)),
                          subtitle: Text(
                              '${m.elevation} MDPL • ${m.difficulty}',
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: AppConstants.kSlate500)),
                          trailing: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: m.status == 'OPEN'
                                  ? AppConstants.kEmerald500
                                      .withValues(alpha: 0.2)
                                  : AppConstants.kRed500
                                      .withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(
                                  AppConstants.kRadiusFull),
                            ),
                            child: Text(
                              m.status,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w800,
                                color: m.status == 'OPEN'
                                    ? AppConstants.kEmerald400
                                    : AppConstants.kRed400,
                              ),
                            ),
                          ),
                          onTap: () =>
                              context.push('/mountains/${m.slug}'),
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
