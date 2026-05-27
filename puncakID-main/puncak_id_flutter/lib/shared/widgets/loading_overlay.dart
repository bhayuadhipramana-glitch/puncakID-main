// ============================================================
// FILE    : lib/shared/widgets/loading_overlay.dart
// FEATURE : Shared / Widgets
// PURPOSE : Full-screen translucent loading indicator overlay
// AUTHOR  : PuncakID Team
// ============================================================

import 'package:flutter/material.dart';

import '../../core/constants/app_constants.dart';

/// Full-screen loading overlay with an emerald spinner.
///
/// Wraps a child widget and shows a translucent overlay when [isLoading] is true.
class LoadingOverlay extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  const LoadingOverlay({
    super.key,
    required this.isLoading,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Container(
            color: AppConstants.kSlate950.withValues(alpha: 0.7),
            child: const Center(
              child: CircularProgressIndicator(
                color: AppConstants.kEmerald500,
                strokeWidth: 3,
              ),
            ),
          ),
      ],
    );
  }
}

/// Centered loading spinner for async content areas.
class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: CircularProgressIndicator(
          color: AppConstants.kEmerald500,
          strokeWidth: 2,
        ),
      ),
    );
  }
}
