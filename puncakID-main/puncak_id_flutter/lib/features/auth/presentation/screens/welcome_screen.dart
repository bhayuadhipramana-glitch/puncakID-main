// ============================================================
// FILE    : lib/features/auth/presentation/screens/welcome_screen.dart
// FEATURE : Auth / Onboarding
// PURPOSE : Landing page extracted from Stitch "Updated Landing Page"
//           screen (projects/10096397962991165293). Full-screen hero
//           with gradient overlay, feature bento grid, and CTA section.
// AUTHOR  : PuncakID Team
// ============================================================

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../core/router/app_router.dart';
import '../../../../shared/widgets/atmospheric_button.dart';

// ── Design DNA Color Tokens (from Stitch "Atmospheric Ascent") ──
const Color _midnightSky = Color(0xFF0B1326);
const Color _surfaceContainer = Color(0xFF171F33);
const Color _surfaceContainerLow = Color(0xFF131B2E);
const Color _primaryContainer = Color(0xFF1B4D3E);
const Color _emeraldCanopy = Color(0xFF2D7D5F);
const Color _emerald400 = Color(0xFF34D399);
const Color _sunsetAmber = Color(0xFFF59E0B);
const Color _amberGlow = Color(0xFFFFB95F);
const Color _onSurface = Color(0xFFDAE2FD);
const Color _onSurfaceVariant = Color(0xFFC0C9C3);
const Color _slate400 = Color(0xFF94A3B8);

/// Welcome/landing screen — the gateway to PuncakID.
///
/// Layout faithfully translated from the Stitch "Updated Landing Page"
/// design (screen ID: 8178e3b87a964afc847dcd2f99d1458e).
///
/// Structure:
/// 1. Hero section — Full-bleed mountain photo with gradient overlay,
///    badge chip, massive headline, subtitle, and CTA button
/// 2. Feature bento grid — Glass cards showcasing core features
/// 3. CTA section — Summit-gradient call to action with social proof
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _midnightSky,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Section 1: Hero ─────────────────────────────
            _buildHeroSection(context),

            // ── Section 2: Feature Bento Grid ───────────────
            _buildFeatureGrid(context),

            // ── Section 3: CTA Section ──────────────────────
            _buildCtaSection(context),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  // ════════════════════════════════════════════════════════════
  //  HERO SECTION
  // ════════════════════════════════════════════════════════════
  Widget _buildHeroSection(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;

    return SizedBox(
      height: screenHeight,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background mountain image
          CachedNetworkImage(
            imageUrl:
                'https://lh3.googleusercontent.com/aida-public/AB6AXuChpCbCDU1i4PnbIziMz4WA9VUoY22U_ZMfJauHltJxXpnpZEOgxnWL0qR4_g634Sq_VhGe40t5dBrU0pSB835zORyFsxTHNXXaIKOoWpT36P5J4eQ5LYAAB4SDTalfTGvEwndULeO1LC8Ty5ebcZ2ksRWaCeFF_COZfun5rDz9eM2baL2PAtGCa7pHV6Y-BuBvE2112UHq30xLM1IOUyFKIsi1_WOqvIesisyAO6LFqkOAzqeHMGGd6TPjLGmbCNM6hNv9feTakE4s',
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(color: _midnightSky),
            errorWidget: (context, url, error) =>
                Container(color: _midnightSky),
          ),

          // Gradient overlay (from Stitch: from-slate-950/40 via-bg/80 to-bg)
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  _midnightSky.withOpacity(0.4),
                  _midnightSky.withOpacity(0.8),
                  _midnightSky,
                ],
                stops: const [0.0, 0.5, 1.0],
              ),
            ),
          ),

          // Decorative emerald glow blob (bottom-right, from Stitch)
          Positioned(
            bottom: 80,
            right: -60,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    _emerald400.withOpacity(0.10),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(flex: 3),

                  // Badge chip — "Explore the Archipelago"
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(999),
                      color: _emerald400.withOpacity(0.10),
                      border: Border.all(
                        color: _emerald400.withOpacity(0.20),
                      ),
                    ),
                    child: Text(
                      'EXPLORE THE ARCHIPELAGO',
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 2.5,
                        color: _emerald400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Main headline — "Jelajahi Puncak Bali"
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Jelajahi\n',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 48,
                            fontWeight: FontWeight.w800,
                            height: 1.1,
                            letterSpacing: -1.5,
                            color: Colors.white,
                          ),
                        ),
                        WidgetSpan(
                          child: ShaderMask(
                            shaderCallback: (bounds) => const LinearGradient(
                              colors: [_emerald400, _sunsetAmber],
                            ).createShader(bounds),
                            child: Text(
                              'Puncak Bali',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 48,
                                fontWeight: FontWeight.w800,
                                height: 1.1,
                                letterSpacing: -1.5,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Subtitle
                  Text(
                    'Komunitas pendaki gunung terbesar di Indonesia. '
                    'Bagikan jurnal, temukan partner, dan pelajari rute '
                    'terbaik untuk petualangan Anda berikutnya.',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      height: 1.6,
                      color: _onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // CTA Button — "Mulai Petualangan"
                  AtmosphericButton(
                    label: 'Mulai Petualangan',
                    type: AtmosphericButtonType.primary,
                    isFullWidth: false,
                    icon: Icons.arrow_forward_rounded,
                    onPressed: () =>
                        context.goNamed(RouteNames.login),
                  ),

                  const Spacer(flex: 1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ════════════════════════════════════════════════════════════
  //  FEATURE BENTO GRID
  // ════════════════════════════════════════════════════════════
  Widget _buildFeatureGrid(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section header — "Fitur Utama PuncakID"
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Fitur Utama ',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                  text: 'PuncakID',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: _emerald400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // Accent bar
          Container(
            width: 60,
            height: 4,
            decoration: BoxDecoration(
              color: _sunsetAmber,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 28),

          // ── Feature Cards ────────────────────────────────
          // Social Feed card (tall)
          _GlassFeatureCard(
            icon: Icons.forum_rounded,
            iconColor: _sunsetAmber,
            title: 'Social Feed',
            description:
                'Berbagi pengalaman dan foto pendakian dengan komunitas secara real-time.',
            height: 200,
          ),
          const SizedBox(height: 16),

          // Gunung Wiki card
          _GlassFeatureCard(
            icon: Icons.menu_book_rounded,
            iconColor: _emerald400,
            title: 'Gunung Wiki',
            description:
                'Database terlengkap mengenai profil gunung di Bali, ketinggian, navigasi, dan tingkat kesulitan.',
            height: 180,
          ),
          const SizedBox(height: 16),

          // Cari Buddy card with avatar stack
          _GlassFeatureCard(
            icon: Icons.group_rounded,
            iconColor: _sunsetAmber,
            title: 'Cari Buddy',
            description:
                'Temukan teman mendaki yang memiliki jadwal dan minat yang sama dengan Anda.',
            height: 200,
            trailing: _buildAvatarStack(),
            chips: const ['Agung Trip', 'Weekend Hiker'],
          ),
          const SizedBox(height: 16),

          // Gear Tracker + Rute Terbaik (side-by-side row)
          Row(
            children: [
              Expanded(
                child: _GlassFeatureCard(
                  icon: Icons.handyman_rounded,
                  iconColor: _emerald400,
                  title: 'Gear Tracker',
                  description: 'Wishlist & tabungan gear.',
                  height: 160,
                  compact: true,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _GlassFeatureCard(
                  icon: Icons.explore_rounded,
                  iconColor: _sunsetAmber,
                  title: 'Rute Terbaik',
                  description: 'Peta offline & log rute.',
                  height: 160,
                  compact: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAvatarStack() {
    final initials = ['PJ', 'AS', '+12'];
    final colors = [
      const Color(0xFF1E293B),
      const Color(0xFF334155),
      const Color(0xFF475569),
    ];

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(initials.length, (i) {
        return Transform.translate(
          offset: Offset(-12.0 * i, 0),
          child: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colors[i],
              border: Border.all(color: _midnightSky, width: 2),
            ),
            alignment: Alignment.center,
            child: Text(
              initials[i],
              style: GoogleFonts.inter(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        );
      }),
    );
  }

  // ════════════════════════════════════════════════════════════
  //  CTA SECTION — "Siap Menaklukkan Puncak Selanjutnya?"
  // ════════════════════════════════════════════════════════════
  Widget _buildCtaSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [_primaryContainer, _emeraldCanopy],
          ),
        ),
        child: Stack(
          children: [
            // Decorative amber blob
            Positioned(
              bottom: -40,
              left: -40,
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      _sunsetAmber.withOpacity(0.20),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),

            // Content
            Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Siap Menaklukkan Puncak Selanjutnya?',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Gabung sekarang dan jadilah bagian dari revolusi pendakian Indonesia.',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.80),
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // "Daftar Sekarang" button → routes to /signup
                  GestureDetector(
                    onTap: () => context.goNamed(RouteNames.signup),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: _primaryContainer.withOpacity(0.20),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Text(
                        'Daftar Sekarang',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: _primaryContainer,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Social proof card (tilted glass card from Stitch)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: _surfaceContainer.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.20),
                          ),
                        ),
                        child: Row(
                          children: [
                            // Avatar
                            Container(
                              width: 44,
                              height: 44,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: _emerald400,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '@andi_rimba',
                                    style: GoogleFonts.plusJakartaSans(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    '"Rute Merapi via Selo sangat menantang!"',
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.white.withOpacity(0.60),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════════
//  GLASS FEATURE CARD (Reusable Bento Grid Component)
//  Implements: glass-card with backdrop-blur, "No-Line" rule
//  (border at white/5 ghost border), and nested border radius.
// ════════════════════════════════════════════════════════════════
class _GlassFeatureCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String description;
  final double height;
  final bool compact;
  final Widget? trailing;
  final List<String>? chips;

  const _GlassFeatureCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.description,
    required this.height,
    this.compact = false,
    this.trailing,
    this.chips,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24), // xl from Design DNA
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          constraints: BoxConstraints(minHeight: height),
          padding: EdgeInsets.all(compact ? 16 : 24),
          decoration: BoxDecoration(
            color: _surfaceContainer.withOpacity(0.6),
            borderRadius: BorderRadius.circular(24),
            // Ghost border (outline_variant at 15% opacity) — Design DNA rule
            border: Border.all(
              color: Colors.white.withOpacity(0.05),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Header row with optional trailing widget
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(icon, size: compact ? 28 : 36, color: iconColor),
                  if (trailing != null) trailing!,
                ],
              ),
              SizedBox(height: compact ? 12 : 16),

              Text(
                title,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: compact ? 16 : 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),

              Text(
                description,
                style: GoogleFonts.inter(
                  fontSize: compact ? 12 : 14,
                  color: _slate400,
                  height: 1.5,
                ),
              ),

              // Optional chips (e.g., "Agung Trip", "Weekend Hiker")
              if (chips != null && chips!.isNotEmpty) ...[
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  children: chips!.map((label) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(999),
                        color: Colors.white.withOpacity(0.05),
                        border: Border.all(
                          color: _emerald400.withOpacity(0.20),
                        ),
                      ),
                      child: Text(
                        label,
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          color: _emerald400,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
