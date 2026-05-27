// ============================================================
// FILE    : lib/core/constants/app_constants.dart
// FEATURE : Core / Constants
// PURPOSE : App-wide UI constants — colors, spacing, strings
// AUTHOR  : PuncakID Team
// ============================================================

import 'package:flutter/material.dart';

/// Application-wide constants for theming, spacing, and UI strings.
///
/// Color palette extracted from the React Tailwind CSS configuration
/// to ensure visual consistency between web and mobile.
class AppConstants {
  AppConstants._();

  // ── App Identity ──────────────────────────────────────────
  static const String kAppName = 'PuncakID';
  static const String kAppTagline = 'Elevate Your Journey';
  static const String kAppDescription =
      'Join the elite community of high-altitude explorers and track your '
      'ascent to the world's most breathtaking summits.';

  // ── Brand Colors (from Tailwind config) ───────────────────
  static const Color kEmerald500 = Color(0xFF10B981);
  static const Color kEmerald600 = Color(0xFF059669);
  static const Color kEmerald400 = Color(0xFF34D399);
  static const Color kAmber500 = Color(0xFFF59E0B);
  static const Color kAmber400 = Color(0xFFFBBF24);
  static const Color kSlate950 = Color(0xFF020617);
  static const Color kSlate900 = Color(0xFF0F172A);
  static const Color kSlate800 = Color(0xFF1E293B);
  static const Color kSlate700 = Color(0xFF334155);
  static const Color kSlate600 = Color(0xFF475569);
  static const Color kSlate500 = Color(0xFF64748B);
  static const Color kSlate400 = Color(0xFF94A3B8);
  static const Color kSlate300 = Color(0xFFCBD5E1);
  static const Color kRed500 = Color(0xFFEF4444);
  static const Color kRed400 = Color(0xFFF87171);
  static const Color kWhite = Color(0xFFFFFFFF);
  static const Color kWhite05 = Color(0x0DFFFFFF); // white/5
  static const Color kWhite10 = Color(0x1AFFFFFF); // white/10

  // ── Spacing ───────────────────────────────────────────────
  static const double kSpaceXs = 4.0;
  static const double kSpaceSm = 8.0;
  static const double kSpaceMd = 16.0;
  static const double kSpaceLg = 24.0;
  static const double kSpaceXl = 32.0;
  static const double kSpace2Xl = 48.0;
  static const double kSpace3Xl = 64.0;

  // ── Border Radius ─────────────────────────────────────────
  static const double kRadiusSm = 8.0;
  static const double kRadiusMd = 12.0;
  static const double kRadiusLg = 16.0;
  static const double kRadiusXl = 20.0;
  static const double kRadius2Xl = 24.0;
  static const double kRadiusFull = 999.0;

  // ── Animation Durations ───────────────────────────────────
  static const Duration kAnimFast = Duration(milliseconds: 200);
  static const Duration kAnimMedium = Duration(milliseconds: 300);
  static const Duration kAnimSlow = Duration(milliseconds: 500);
  static const Duration kAnimVerySlow = Duration(milliseconds: 700);

  // ── Mountain Difficulty Labels ────────────────────────────
  static const Map<String, String> kDifficultyLabels = {
    'easy': 'Beginner',
    'moderate': 'Intermediate',
    'hard': 'Advanced',
  };

  // ── Social Platform Options ───────────────────────────────
  static const List<String> kSocialPlatforms = [
    'whatsapp',
    'instagram',
    'telegram',
    'line',
  ];

  // ── Gear Saving Frequencies ───────────────────────────────
  static const List<String> kGearFrequencies = [
    'daily',
    'weekly',
    'monthly',
  ];

  // ── Gear Status Options ───────────────────────────────────
  static const List<String> kGearStatuses = [
    'saving',
    'collected',
  ];
}
