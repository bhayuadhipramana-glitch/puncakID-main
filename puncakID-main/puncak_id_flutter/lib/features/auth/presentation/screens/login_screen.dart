// ============================================================
// FILE    : lib/features/auth/presentation/screens/login_screen.dart
// FEATURE : Auth / Onboarding
// PURPOSE : Login form screen extracted from Stitch "Login" screen
//           (projects/10096397962991165293/screens/cc759f...).
//           Glass-panel form with "No-Line" inputs, animated
//           focus glow, and AtmosphericButton CTA.
// AUTHOR  : PuncakID Team
// ============================================================

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/router/app_router.dart';
import '../../../../shared/widgets/atmospheric_button.dart';
import '../../../../shared/widgets/atmospheric_text_field.dart';

// ── Design DNA Color Tokens (from Stitch "Atmospheric Ascent") ──
const Color _midnightSky = Color(0xFF0B1326);
const Color _surfaceContainer = Color(0xFF171F33);
const Color _surfaceContainerHighest = Color(0xFF2D3449);
const Color _surfaceBright = Color(0xFF31394D);
const Color _primaryContainer = Color(0xFF1B4D3E);
const Color _emeraldCanopy = Color(0xFF2D7D5F);
const Color _emerald400 = Color(0xFF34D399);
const Color _emerald500 = Color(0xFF10B981);
const Color _sunsetAmber = Color(0xFFF59E0B);
const Color _amberGlow = Color(0xFFFFB95F);
const Color _onSurface = Color(0xFFDAE2FD);
const Color _onSurfaceVariant = Color(0xFFC0C9C3);
const Color _outline = Color(0xFF8A938E);
const Color _secondary = Color(0xFF88D6B3);

/// Login screen — transactional page (no bottom navigation shell).
///
/// Layout faithfully translated from the Stitch "Login" screen.
/// Mobile layout: branding icon + glass form panel + mountain silhouette.
/// All inputs follow the "No-Line" rule with animated amber focus glow.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    // TODO: Replace with real Riverpod auth provider call via Dio
    // For now, route directly to dashboard
    Future.delayed(const Duration(milliseconds: 800), () {
      if (!mounted) return;
      setState(() => _isLoading = false);
      context.goNamed(RouteNames.dashboard);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _midnightSky,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // ── Decorative mountain silhouette (from Stitch SVG) ──
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Opacity(
              opacity: 0.10,
              child: CustomPaint(
                size: Size(MediaQuery.sizeOf(context).width, 200),
                painter: _MountainSilhouettePainter(),
              ),
            ),
          ),

          // ── Decorative glow blobs ────────────────────────
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    _emerald500.withOpacity(0.05),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -150,
            left: -150,
            child: Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    _primaryContainer.withOpacity(0.05),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // ── Main content ─────────────────────────────────
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 32),

                    // ── Mobile Branding ────────────────────
                    _buildMobileBranding(),
                    const SizedBox(height: 40),

                    // ── Header ─────────────────────────────
                    _buildHeader(),
                    const SizedBox(height: 32),

                    // ── Glass Panel Form ───────────────────
                    _buildGlassFormPanel(),

                    // ── Footer Links ───────────────────────
                    _buildFooterLinks(),

                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ════════════════════════════════════════════════════════════
  //  MOBILE BRANDING — Icon + "PuncakID"
  // ════════════════════════════════════════════════════════════
  Widget _buildMobileBranding() {
    return Column(
      children: [
        // Logo container
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: _primaryContainer,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: _emerald500.withOpacity(0.20),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: const Icon(
            Icons.landscape_rounded,
            size: 36,
            color: _emerald400,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'PUNCAKID',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 24,
            fontWeight: FontWeight.w900,
            color: _emerald500,
            letterSpacing: 6,
          ),
        ),
      ],
    );
  }

  // ════════════════════════════════════════════════════════════
  //  HEADER — "Welcome Back" + subtitle
  // ════════════════════════════════════════════════════════════
  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome Back',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: _onSurface,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Secure your gear and prepare for the next climb.',
          style: GoogleFonts.inter(
            fontSize: 14,
            color: _onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  // ════════════════════════════════════════════════════════════
  //  GLASS PANEL FORM — Email, Password, Submit, Sign Up link
  // ════════════════════════════════════════════════════════════
  Widget _buildGlassFormPanel() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            color: _surfaceContainer.withOpacity(0.6),
            borderRadius: BorderRadius.circular(16),
            // Ghost border — "felt, not seen"
            border: Border.all(
              color: Colors.white.withOpacity(0.05),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.40),
                blurRadius: 40,
                offset: const Offset(0, 16),
              ),
            ],
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Email Field ────────────────────────────
                _buildFieldLabel('CLIMBER EMAIL'),
                const SizedBox(height: 8),
                _buildEmailField(),
                const SizedBox(height: 24),

                // ── Password Field ─────────────────────────
                _buildPasswordHeader(),
                const SizedBox(height: 8),
                _buildPasswordField(),
                const SizedBox(height: 32),

                // ── Submit Button ──────────────────────────
                AtmosphericButton(
                  label: 'Login',
                  icon: Icons.east_rounded,
                  isLoading: _isLoading,
                  onPressed: _handleLogin,
                ),

                // ── Sign Up Link ───────────────────────────
                const SizedBox(height: 32),
                Container(
                  padding: const EdgeInsets.only(top: 24),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Color(0x0DFFFFFF), // white/5
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: _onSurfaceVariant,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => context.goNamed(RouteNames.signup),
                        child: Text(
                          'Sign Up',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: _secondary,
                            decoration: TextDecoration.none,
                          ),
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
    );
  }

  // ── Field label (uppercase, tracking-widest) ──────────────
  Widget _buildFieldLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 2),
      child: Text(
        text,
        style: GoogleFonts.inter(
          fontSize: 10,
          fontWeight: FontWeight.w800,
          letterSpacing: 2.5,
          color: _onSurfaceVariant,
        ),
      ),
    );
  }

  // ── Password header with "Forgot Password?" link ──────────
  Widget _buildPasswordHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildFieldLabel('SECURITY KEY'),
        GestureDetector(
          onTap: () {
            // TODO: Navigate to forgot password screen
          },
          child: Text(
            'Forgot Password?',
            style: GoogleFonts.inter(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: _sunsetAmber,
            ),
          ),
        ),
      ],
    );
  }

  // ════════════════════════════════════════════════════════════
  //  INPUT FIELDS — "No-Line" rule with animated amber focus
  //  bg: surfaceContainerHighest, no border, rounded-xl
  //  focus: surfaceBright bg + 2px amber bottom glow
  // ════════════════════════════════════════════════════════════
  Widget _buildEmailField() {
    return AtmosphericTextField(
      controller: _emailController,
      hintText: 'name@summit.id',
      prefixIcon: Icons.mail_outlined,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) return 'Email is required';
        if (!value.contains('@')) return 'Enter a valid email';
        return null;
      },
    );
  }

  Widget _buildPasswordField() {
    return AtmosphericTextField(
      controller: _passwordController,
      hintText: '••••••••',
      prefixIcon: Icons.lock_outline_rounded,
      obscureText: _obscurePassword,
      suffixIcon: IconButton(
        icon: Icon(
          _obscurePassword
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
          color: _outline,
          size: 20,
        ),
        onPressed: () {
          setState(() => _obscurePassword = !_obscurePassword);
        },
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return 'Password is required';
        if (value.length < 6) return 'Minimum 6 characters';
        return null;
      },
    );
  }

  // ════════════════════════════════════════════════════════════
  //  FOOTER LINKS — Terms, Privacy, Support
  // ════════════════════════════════════════════════════════════
  Widget _buildFooterLinks() {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: ['TERMS', 'PRIVACY', 'SUPPORT']
            .map(
              (label) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  label,
                  style: GoogleFonts.inter(
                    fontSize: 9,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2,
                    color: _outline,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}



// ════════════════════════════════════════════════════════════════
//  MOUNTAIN SILHOUETTE PAINTER (Decorative Background)
//  Extracted from the Stitch SVG path:
//  "M0,300 L200,100 L400,200 L600,50 L800,180 L1000,80 L1200,300 Z"
// ════════════════════════════════════════════════════════════════
class _MountainSilhouettePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = _emeraldCanopy
      ..style = PaintingStyle.fill;

    final w = size.width;
    final h = size.height;

    final path = Path()
      ..moveTo(0, h)
      ..lineTo(w * 0.167, h * 0.333) // Peak 1
      ..lineTo(w * 0.333, h * 0.667) // Valley
      ..lineTo(w * 0.500, h * 0.167) // Tallest peak
      ..lineTo(w * 0.667, h * 0.600) // Valley
      ..lineTo(w * 0.833, h * 0.267) // Peak 3
      ..lineTo(w, h)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
