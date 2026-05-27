// ============================================================
// FILE    : lib/core/router/app_router.dart
// FEATURE : Core / Router
// PURPOSE : GoRouter configuration with auth guards mapped
//           from React Router DOM ProtectedRoute / AdminRoute
// AUTHOR  : PuncakID Team
// ============================================================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/domain/providers/auth_provider.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/signup_screen.dart';
import '../../features/auth/presentation/screens/welcome_screen.dart';
import '../../features/buddy_finder/presentation/screens/buddy_finder_screen.dart';
import '../../features/dashboard/presentation/screens/dashboard_screen.dart';
import '../../features/expedition/presentation/screens/plan_expedition_screen.dart';
import '../../features/gear/presentation/screens/add_gear_screen.dart';
import '../../features/gear/presentation/screens/gear_tracker_screen.dart';
import '../../features/mountains/presentation/screens/forum_screen.dart';
import '../../features/mountains/presentation/screens/mountain_detail_screen.dart';
import '../../features/mountains/presentation/screens/mountains_screen.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';
import '../../features/profile/presentation/screens/settings_screen.dart';
import '../../features/admin/presentation/screens/admin_screen.dart';
import '../../features/dashboard/presentation/screens/community_feed_screen.dart';
import '../../shared/widgets/app_scaffold.dart';

// ── Route Name Constants ────────────────────────────────────
class RouteNames {
  RouteNames._();
  static const String welcome = 'welcome';
  static const String login = 'login';
  static const String signup = 'signup';
  static const String dashboard = 'dashboard';
  static const String mountains = 'mountains';
  static const String mountainDetail = 'mountainDetail';
  static const String planExpedition = 'planExpedition';
  static const String forum = 'forum';
  static const String buddyFinder = 'buddyFinder';
  static const String gear = 'gear';
  static const String gearAdd = 'gearAdd';
  static const String profile = 'profile';
  static const String settings = 'settings';
  static const String feed = 'feed';
  static const String admin = 'admin';
}

/// Creates the [GoRouter] instance with auth-aware redirects.
///
/// Route guards replicate the React ProtectedRoute and AdminRoute:
/// - Unauthenticated users are redirected to /login for protected routes
/// - Non-admin users are redirected to /dashboard for /admin
/// - Authenticated users are redirected away from /login and /signup
final goRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isLoggedIn = authState.valueOrNull != null;
      final isAdmin = authState.valueOrNull?.isAdmin ?? false;
      final location = state.matchedLocation;

      // Public routes that don't need any redirect
      final publicRoutes = ['/', '/login', '/signup'];
      final openRoutes = ['/mountains', '/buddy-finder'];

      // If auth is still loading, don't redirect
      if (authState.isLoading) return null;

      // Authenticated users shouldn't see login/signup/welcome
      if (isLoggedIn && publicRoutes.contains(location)) {
        return isAdmin ? '/admin' : '/dashboard';
      }

      // Protected routes require auth
      final protectedPrefixes = [
        '/dashboard',
        '/gear',
        '/profile',
        '/settings',
        '/admin',
      ];

      // Check if current location requires auth
      final needsAuth = protectedPrefixes.any(
            (prefix) => location.startsWith(prefix),
          ) ||
          location.contains('/plan');

      if (!isLoggedIn && needsAuth) {
        return '/login';
      }

      // Admin route requires admin role
      if (location.startsWith('/admin') && !isAdmin) {
        return isLoggedIn ? '/dashboard' : '/login';
      }

      return null;
    },
    routes: [
      // ── Public (no scaffold) ────────────────────────────
      GoRoute(
        path: '/',
        name: RouteNames.welcome,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: '/login',
        name: RouteNames.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/signup',
        name: RouteNames.signup,
        builder: (context, state) => const SignUpScreen(),
      ),

      // ── Mountain detail (no bottom nav) ─────────────────
      GoRoute(
        path: '/mountains/:slug',
        name: RouteNames.mountainDetail,
        builder: (context, state) {
          final slug = state.pathParameters['slug']!;
          return MountainDetailScreen(slug: slug);
        },
        routes: [
          GoRoute(
            path: 'plan',
            name: RouteNames.planExpedition,
            builder: (context, state) {
              final slug = state.pathParameters['slug']!;
              return PlanExpeditionScreen(mountainSlug: slug);
            },
          ),
          GoRoute(
            path: 'forum',
            name: RouteNames.forum,
            builder: (context, state) {
              final slug = state.pathParameters['slug']!;
              return ForumScreen(mountainSlug: slug);
            },
          ),
        ],
      ),

      // ── Admin (no bottom nav) ───────────────────────────
      GoRoute(
        path: '/admin',
        name: RouteNames.admin,
        builder: (context, state) => const AdminScreen(),
      ),

      // ── Main shell with bottom navigation ───────────────
      ShellRoute(
        builder: (context, state, child) => AppScaffold(child: child),
        routes: [
          GoRoute(
            path: '/dashboard',
            name: RouteNames.dashboard,
            builder: (context, state) => const DashboardScreen(),
          ),
          GoRoute(
            path: '/feed',
            name: RouteNames.feed,
            builder: (context, state) => const CommunityFeedScreen(),
          ),
          GoRoute(
            path: '/mountains',
            name: RouteNames.mountains,
            builder: (context, state) => const MountainsScreen(),
          ),
          GoRoute(
            path: '/buddy-finder',
            name: RouteNames.buddyFinder,
            builder: (context, state) => const BuddyFinderScreen(),
          ),
          GoRoute(
            path: '/gear',
            name: RouteNames.gear,
            builder: (context, state) => const GearTrackerScreen(),
            routes: [
              GoRoute(
                path: 'add',
                name: RouteNames.gearAdd,
                builder: (context, state) => const AddGearScreen(),
              ),
            ],
          ),
          GoRoute(
            path: '/profile',
            name: RouteNames.profile,
            builder: (context, state) => const ProfileScreen(),
          ),
          GoRoute(
            path: '/settings',
            name: RouteNames.settings,
            builder: (context, state) => const SettingsScreen(),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text(
          'Page not found: ${state.matchedLocation}',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    ),
  );
});
