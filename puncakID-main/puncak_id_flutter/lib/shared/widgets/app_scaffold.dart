// ============================================================
// FILE    : lib/shared/widgets/app_scaffold.dart
// FEATURE : Shared / Widgets
// PURPOSE : Shell scaffold with bottom navigation bar replacing
//           the React sidebar Layout.jsx
// AUTHOR  : PuncakID Team
// ============================================================

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_constants.dart';

/// Main scaffold with bottom navigation for tabbed pages.
///
/// Replaces the React Layout.jsx sidebar navigation with a mobile-native
/// bottom navigation bar. Used as a ShellRoute builder in GoRouter.
class AppScaffold extends StatelessWidget {
  final Widget child;

  const AppScaffold({super.key, required this.child});

  static const _navItems = [
    _NavItem(icon: Icons.dashboard_rounded, label: 'Home', path: '/dashboard'),
    _NavItem(icon: Icons.terrain_rounded, label: 'Mountains', path: '/mountains'),
    _NavItem(icon: Icons.group_rounded, label: 'Buddy', path: '/buddy-finder'),
    _NavItem(icon: Icons.backpack_rounded, label: 'Gear', path: '/gear'),
    _NavItem(icon: Icons.person_rounded, label: 'Profile', path: '/profile'),
  ];

  int _getCurrentIndex(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    for (int i = 0; i < _navItems.length; i++) {
      if (location.startsWith(_navItems[i].path)) return i;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _getCurrentIndex(context);

    return Scaffold(
      body: child,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppConstants.kSlate950,
          border: Border(
            top: BorderSide(
              color: AppConstants.kWhite.withValues(alpha: 0.05),
            ),
          ),
        ),
        child: SafeArea(
          child: SizedBox(
            height: 64,
            child: Row(
              children: List.generate(_navItems.length, (index) {
                final item = _navItems[index];
                final isActive = index == currentIndex;

                return Expanded(
                  child: InkWell(
                    onTap: () {
                      if (!isActive) context.go(item.path);
                    },
                    child: AnimatedContainer(
                      duration: AppConstants.kAnimMedium,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedContainer(
                            duration: AppConstants.kAnimMedium,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: isActive
                                  ? AppConstants.kEmerald500.withValues(alpha: 0.15)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(
                                AppConstants.kRadiusFull,
                              ),
                            ),
                            child: Icon(
                              item.icon,
                              size: 24,
                              color: isActive
                                  ? AppConstants.kEmerald500
                                  : AppConstants.kSlate600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item.label,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight:
                                  isActive ? FontWeight.w700 : FontWeight.w500,
                              color: isActive
                                  ? AppConstants.kEmerald500
                                  : AppConstants.kSlate600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final String label;
  final String path;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.path,
  });
}
