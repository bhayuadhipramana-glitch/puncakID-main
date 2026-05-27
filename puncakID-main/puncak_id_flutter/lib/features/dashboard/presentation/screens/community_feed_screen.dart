// ============================================================
// FILE    : lib/features/dashboard/presentation/screens/community_feed_screen.dart
// FEATURE : Dashboard / Community Feed
// PURPOSE : Top-level community feed screen mapped from Stitch
//           "Community Feed" design — placeholder until UI build
// AUTHOR  : PuncakID Team
// ============================================================

import 'package:flutter/material.dart';

/// Community Feed screen — a dedicated top-level route (/feed)
/// for the social hiking feed identified in the Stitch design.
///
/// This placeholder will be replaced with the full UI implementation
/// once we begin the screen-building phase.
class CommunityFeedScreen extends StatelessWidget {
  const CommunityFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Community Feed — Placeholder',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
