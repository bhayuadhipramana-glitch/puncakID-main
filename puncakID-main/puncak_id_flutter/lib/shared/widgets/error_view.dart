// ============================================================
// FILE    : lib/shared/widgets/error_view.dart
// FEATURE : Shared / Widgets
// PURPOSE : Error display with retry button for API failures
// AUTHOR  : PuncakID Team
// ============================================================

import 'package:flutter/material.dart';

import '../../core/constants/app_constants.dart';

/// Error view with icon, message, and optional retry button.
///
/// Used for API errors (timeout, 500, etc.) throughout the app.
class ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;
  final IconData icon;

  const ErrorView({
    super.key,
    required this.message,
    this.onRetry,
    this.icon = Icons.error_outline_rounded,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.kSpaceXl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 56,
              color: AppConstants.kSlate600,
            ),
            const SizedBox(height: AppConstants.kSpaceMd),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppConstants.kSlate400,
                  ),
            ),
            if (onRetry != null) ...[
              const SizedBox(height: AppConstants.kSpaceLg),
              OutlinedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh_rounded),
                label: const Text('Try Again'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Empty state view for when there's no data to show.
class EmptyView extends StatelessWidget {
  final String message;
  final String? subtitle;
  final IconData icon;
  final Widget? action;

  const EmptyView({
    super.key,
    required this.message,
    this.subtitle,
    this.icon = Icons.inbox_rounded,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.kSpaceXl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 56, color: AppConstants.kSlate600),
            const SizedBox(height: AppConstants.kSpaceMd),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppConstants.kSlate400,
                  ),
            ),
            if (subtitle != null) ...[
              const SizedBox(height: AppConstants.kSpaceSm),
              Text(
                subtitle!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
            if (action != null) ...[
              const SizedBox(height: AppConstants.kSpaceLg),
              action!,
            ],
          ],
        ),
      ),
    );
  }
}
