// ============================================================
// FILE    : lib/main.dart
// FEATURE : App Entry Point
// PURPOSE : Application bootstrap — initializes Flutter bindings,
//           wraps the widget tree in Riverpod ProviderScope, and
//           configures MaterialApp.router with GoRouter + AppTheme.
// AUTHOR  : PuncakID Team
// ============================================================

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Lock orientation to portrait for the mobile hiking experience
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Set system UI overlay style to match the "Midnight Sky" theme
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Color(0xFF0B1326), // Midnight Sky
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );

  runApp(
    const ProviderScope(
      child: PuncakIDApp(),
    ),
  );
}

/// Root application widget.
///
/// Uses [ConsumerWidget] to watch the [goRouterProvider] from Riverpod,
/// ensuring the router reacts to auth state changes for route guards.
class PuncakIDApp extends ConsumerWidget {
  const PuncakIDApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GoRouter router = ref.watch(goRouterProvider);

    return MaterialApp.router(
      // ── App Identity ──────────────────────────────────────
      title: 'PuncakID',
      debugShowCheckedModeBanner: false,

      // ── Theme: "The Atmospheric Ascent" Design System ─────
      theme: AppTheme.darkTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,

      // ── Router: GoRouter with auth-aware redirects ────────
      routerConfig: router,
    );
  }
}
