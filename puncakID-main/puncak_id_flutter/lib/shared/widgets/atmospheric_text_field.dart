// ============================================================
// FILE    : lib/shared/widgets/atmospheric_text_field.dart
// FEATURE : Shared / Widgets
// PURPOSE : Reusable form input component with glassmorphism and animated glows.
// AUTHOR  : PuncakID Team
// ============================================================

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ════════════════════════════════════════════════════════════════
//  ATMOSPHERIC TEXT FIELD
//  Implements the Stitch "No-Line" input design:
//  - Filled bg: surfaceContainerHighest (no border)
//  - Focus: bg shifts to surfaceBright + 2px amber bottom glow
//    that animates from center outward (w-0 → w-full)
//  - Leading icon transitions to amber on focus
// ════════════════════════════════════════════════════════════════
class AtmosphericTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData prefixIcon;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const AtmosphericTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType,
    this.validator,
  });

  @override
  State<AtmosphericTextField> createState() => _AtmosphericTextFieldState();
}

class _AtmosphericTextFieldState extends State<AtmosphericTextField>
    with SingleTickerProviderStateMixin {
  bool _isFocused = false;
  late AnimationController _glowController;
  late Animation<double> _glowAnimation;

  // ── Colors from "Atmospheric Ascent" ──
  static const Color _surfaceContainerHighest = Color(0xFF2D3449);
  static const Color _surfaceBright = Color(0xFF31394D);
  static const Color _sunsetAmber = Color(0xFFF59E0B);
  static const Color _onSurface = Color(0xFFDAE2FD);
  static const Color _outline = Color(0xFF8A938E);

  @override
  void initState() {
    super.initState();
    _glowController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _glowAnimation = CurvedAnimation(
      parent: _glowController,
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _glowController.dispose();
    super.dispose();
  }

  void _onFocusChange(bool hasFocus) {
    setState(() => _isFocused = hasFocus);
    if (hasFocus) {
      _glowController.forward();
    } else {
      _glowController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: _isFocused ? _surfaceBright : _surfaceContainerHighest,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Focus(
            onFocusChange: _onFocusChange,
            child: TextFormField(
              controller: widget.controller,
              obscureText: widget.obscureText,
              keyboardType: widget.keyboardType,
              validator: widget.validator,
              style: GoogleFonts.inter(
                fontSize: 15,
                color: _onSurface,
              ),
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: GoogleFonts.inter(
                  fontSize: 15,
                  color: _outline.withOpacity(0.50),
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 12),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: Icon(
                      widget.prefixIcon,
                      key: ValueKey(_isFocused),
                      size: 22,
                      color: _isFocused ? _sunsetAmber : _outline,
                    ),
                  ),
                ),
                prefixIconConstraints: const BoxConstraints(
                  minWidth: 50,
                  minHeight: 0,
                ),
                suffixIcon: widget.suffixIcon,
                filled: false,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 18,
                ),
              ),
            ),
          ),
        ),

        // ── Animated amber bottom glow (center → full width) ──
        LayoutBuilder(
          builder: (context, constraints) {
            return AnimatedBuilder(
              animation: _glowAnimation,
              builder: (context, child) {
                return Center(
                  child: Container(
                    width: _glowAnimation.value * constraints.maxWidth,
                    height: 2,
                    decoration: BoxDecoration(
                      color: _sunsetAmber,
                      borderRadius: BorderRadius.circular(1),
                      boxShadow: [
                        BoxShadow(
                          color: _sunsetAmber.withOpacity(0.40),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
