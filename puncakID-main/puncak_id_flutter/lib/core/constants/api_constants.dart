// ============================================================
// FILE    : lib/core/constants/api_constants.dart
// FEATURE : Core / Constants
// PURPOSE : Centralized API endpoint strings and base URL
// AUTHOR  : PuncakID Team
// ============================================================

/// All API endpoint constants used throughout the application.
///
/// No magic strings — every endpoint is defined here and referenced
/// by name in repositories and network calls.
class ApiConstants {
  ApiConstants._();

  // ── Base URL ─────────────────────────────────────────A─────
  // For Android emulator: use 10.0.2.2 to reach host machine's localhost.
  // For physical device / production: replace with actual server URL.
  static const String kBaseUrl = 'http://10.0.2.2:8000/api';

  // ── Auth ──────────────────────────────────────────────────
  static const String kLogin = '/login';
  static const String kRegister = '/register';
  static const String kUser = '/user';
  static const String kLogout = '/logout';

  // ── Profile ───────────────────────────────────────────────
  static const String kProfile = '/profile';
  static const String kProfilePassword = '/profile/password';

  // ── Mountains (public) ────────────────────────────────────
  static const String kMountains = '/mountains';
  static String kMountainDetail(String slug) => '/mountains/$slug';
  static String kMountainOthers(String slug) => '/mountains/$slug/others';

  // ── Photos (public feed) ──────────────────────────────────
  static const String kPhotos = '/photos';
  static String kUserPhotos(int userId) => '/users/$userId/photos';
  static String kPhotoDelete(int photoId) => '/photos/$photoId';

  // ── Hike Plans (buddy finder) ─────────────────────────────
  static const String kHikePlans = '/hike-plans';
  static String kHikePlanDetail(int id) => '/hike-plans/$id';

  // ── Forum ─────────────────────────────────────────────────
  static String kThreads(String mountainSlug) =>
      '/mountains/$mountainSlug/threads';
  static String kReplies(int threadId) => '/threads/$threadId/replies';

  // ── Checklist (personal per mountain) ─────────────────────
  static String kChecklist(int mountainId) => '/checklist/$mountainId';
  static const String kChecklistStore = '/checklist';
  static String kChecklistItem(int itemId) => '/checklist/$itemId';

  // ── Gear Wishlists ────────────────────────────────────────
  static const String kGearWishlists = '/gear-wishlists';
  static const String kGearWishlistsSummary = '/gear-wishlists/summary';
  static String kGearWishlistItem(int id) => '/gear-wishlists/$id';

  // ── Admin ─────────────────────────────────────────────────
  static String kAdminMountainUpdate(String slug) => '/admin/mountains/$slug';
  static String kAdminMountainToggleStatus(String slug) =>
      '/admin/mountains/$slug/status';
  static String kAdminTrailheadStore(String mountainSlug) =>
      '/admin/mountains/$mountainSlug/trailheads';
  static String kAdminTrailheadUpdate(int id) => '/admin/trailheads/$id';
  static String kAdminTrailheadDelete(int id) => '/admin/trailheads/$id';
  static String kAdminGearRecStore(String mountainSlug) =>
      '/admin/mountains/$mountainSlug/gear-recommendations';
  static String kAdminGearRecUpdate(int id) =>
      '/admin/gear-recommendations/$id';
  static String kAdminGearRecDelete(int id) =>
      '/admin/gear-recommendations/$id';
  static String kAdminFirstAidStore(String mountainSlug) =>
      '/admin/mountains/$mountainSlug/first-aid-items';
  static String kAdminFirstAidUpdate(int id) => '/admin/first-aid-items/$id';
  static String kAdminFirstAidDelete(int id) => '/admin/first-aid-items/$id';
}
