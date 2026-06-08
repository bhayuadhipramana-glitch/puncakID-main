// ============================================================
// FILE    : lib/features/auth/presentation/screens/signup_screen.dart
// FEATURE : Auth / Onboarding
// PURPOSE : Sign Up form screen.
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
const Color _primaryContainer = Color(0xFF1B4D3E);
const Color _emeraldCanopy = Color(0xFF2D7D5F);
const Color _emerald400 = Color(0xFF34D399);
const Color _emerald500 = Color(0xFF10B981);
const Color _sunsetAmber = Color(0xFFF59E0B);
const Color _onSurface = Color(0xFFDAE2FD);
const Color _onSurfaceVariant = Color(0xFFC0C9C3);
const Color _outline = Color(0xFF8A938E);
const Color _secondary = Color(0xFF88D6B3);

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleSignup() {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

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
          // ── Decorative mountain silhouette ──
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

          // ── Decorative glow blobs ──
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

          // ── Main content ──
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 32),
                    _buildMobileBranding(),
                    const SizedBox(height: 40),
                    _buildHeader(),
                    const SizedBox(height: 32),
                    _buildGlassFormPanel(),
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

  Widget _buildMobileBranding() {
    return Column(
      children: [
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

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Join the Ascent',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: _onSurface,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Create your account and start tracking your climbs.',
          style: GoogleFonts.inter(
            fontSize: 14,
            color: _onSurfaceVariant,
          ),
        ),
      ],
    );
  }

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
                _buildFieldLabel('FULL NAME'),
                const SizedBox(height: 8),
                _buildNameField(),
                const SizedBox(height: 20),

                _buildFieldLabel('EMAIL ADDRESS'),
                const SizedBox(height: 8),
                _buildEmailField(),
                const SizedBox(height: 20),

                _buildFieldLabel('PASSWORD'),
                const SizedBox(height: 8),
                _buildPasswordField(),
                const SizedBox(height: 20),

                _buildFieldLabel('CONFIRM PASSWORD'),
                const SizedBox(height: 8),
                _buildConfirmPasswordField(),
                const SizedBox(height: 32),

                _buildSubmitButton(),
                const SizedBox(height: 16),
                _buildLoginLink(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFieldLabel(String text) {
    return Text(
      text,
      style: GoogleFonts.inter(
        fontSize: 10,
        fontWeight: FontWeight.w600,
        color: _emerald400,
        letterSpacing: 1.5,
      ),
    );
  }

  Widget _buildNameField() {
    return AtmosphericTextField(
      controller: _nameController,
      hintText: 'John Doe',
      prefixIcon: Icons.person_outline,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Please enter your name';
        }
        return null;
      },
    );
  }

  Widget _buildEmailField() {
    return AtmosphericTextField(
      controller: _emailController,
      hintText: 'yours@example.com',
      prefixIcon: Icons.email_outlined,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Please enter your email';
        }
        if (!value.contains('@') || !value.contains('.')) {
          return 'Please enter a valid email';
        }
        return null;
      },
    );
  }

  Widget _buildPasswordField() {
    return AtmosphericTextField(
      controller: _passwordController,
      hintText: '••••••••',
      prefixIcon: Icons.lock_outline,
      obscureText: _obscurePassword,
      suffixIcon: IconButton(
        icon: Icon(
          _obscurePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
          color: _onSurfaceVariant,
        ),
        onPressed: () {
          setState(() {
            _obscurePassword = !_obscurePassword;
          });
        },
      ),
      validator: (value) {
        if (value == null || value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
    );
  }

  Widget _buildConfirmPasswordField() {
    return AtmosphericTextField(
      controller: _confirmPasswordController,
      hintText: '••••••••',
      prefixIcon: Icons.lock_outline,
      obscureText: _obscureConfirmPassword,
      suffixIcon: IconButton(
        icon: Icon(
          _obscureConfirmPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
          color: _onSurfaceVariant,
        ),
        onPressed: () {
          setState(() {
            _obscureConfirmPassword = !_obscureConfirmPassword;
          });
        },
      ),
      validator: (value) {
        if (value != _passwordController.text) {
          return 'Passwords do not match';
        }
        return null;
      },
    );
  }

  Widget _buildSubmitButton() {
    return AtmosphericButton(
      label: 'Create Account',
      isLoading: _isLoading,
      onPressed: _handleSignup,
    );
  }

  Widget _buildLoginLink() {
    return Center(
      child: GestureDetector(
        onTap: () {
          // Go to login screen
          context.pop();
        },
        child: RichText(
          text: TextSpan(
            text: 'Already have an account? ',
            style: GoogleFonts.inter(
              color: _onSurfaceVariant,
              fontSize: 14,
            ),
            children: [
              TextSpan(
                text: 'Log in',
                style: GoogleFonts.inter(
                  color: _emerald400,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MountainSilhouettePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = _emerald400
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.5);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.3,
      size.width * 0.5,
      size.height * 0.6,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.8,
      size.width,
      size.height * 0.4,
    );
    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
