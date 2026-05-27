// ============================================================
// FILE    : lib/shared/widgets/atmospheric_button.dart
// FEATURE : Shared / Widgets
// PURPOSE : Reusable button component based on "Atmospheric Ascent" Design DNA
// AUTHOR  : PuncakID Team
// ============================================================

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum AtmosphericButtonType {
  primary,
  secondaryGlass,
  tertiaryAction,
}

/// A high-end button component extracted from the "Atmospheric Ascent" 
/// Stitch design system. Features tonal layering, glassmorphism, 
/// and inner glow effects.
class AtmosphericButton extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final IconData? icon;
  final AtmosphericButtonType type;
  final bool isFullWidth;

  const AtmosphericButton({
    super.key,
    required this.label,
    this.onPressed,
    this.isLoading = false,
    this.icon,
    this.type = AtmosphericButtonType.primary,
    this.isFullWidth = true,
  });

  @override
  State<AtmosphericButton> createState() => _AtmosphericButtonState();
}

class _AtmosphericButtonState extends State<AtmosphericButton>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  bool _isPressed = false;

  // Design DNA Colors
  static const Color _primaryContainer = Color(0xFF1B4D3E);
  static const Color _surfaceContainer = Color(0xFF171F33);
  static const Color _tertiaryAmber = Color(0xFFF59E0B);
  static const Color _onPrimary = Colors.white;

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = widget.onPressed == null || widget.isLoading;

    Widget buttonContent = Row(
      mainAxisSize: widget.isFullWidth ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.isLoading)
          SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: widget.type == AtmosphericButtonType.tertiaryAction
                  ? _tertiaryAmber
                  : _onPrimary,
            ),
          )
        else ...[
          Text(
            widget.label,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
              color: widget.type == AtmosphericButtonType.tertiaryAction
                  ? _tertiaryAmber
                  : _onPrimary.withOpacity(isDisabled ? 0.5 : 1.0),
            ),
          ),
          if (widget.icon != null) ...[
            const SizedBox(width: 8),
            Icon(
              widget.icon,
              size: 20,
              color: widget.type == AtmosphericButtonType.tertiaryAction
                  ? _tertiaryAmber
                  : _onPrimary.withOpacity(isDisabled ? 0.5 : 1.0),
            ),
          ],
        ],
      ],
    );

    // Tertiary: Text-only with Amber color
    if (widget.type == AtmosphericButtonType.tertiaryAction) {
      return GestureDetector(
        onTap: isDisabled ? null : widget.onPressed,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: isDisabled ? 0.5 : (_isPressed ? 0.7 : 1.0),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            width: widget.isFullWidth ? double.infinity : null,
            alignment: Alignment.center,
            child: buttonContent,
          ),
        ),
      );
    }

    // Determine background color and border based on type
    final Color bgColor = widget.type == AtmosphericButtonType.primary
        ? _primaryContainer
        : _surfaceContainer.withOpacity(0.6); // 60% opacity for glass

    Widget container = AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      width: widget.isFullWidth ? double.infinity : null,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      decoration: BoxDecoration(
        color: bgColor.withOpacity(isDisabled ? 0.5 : (bgColor.opacity)),
        borderRadius: BorderRadius.circular(8), // ROUND_EIGHT
        boxShadow: widget.type == AtmosphericButtonType.primary
            ? [
                // Ambient Shadow (Tinted with primary hue)
                BoxShadow(
                  color: _primaryContainer.withOpacity(_isHovered ? 0.15 : 0.08),
                  blurRadius: _isHovered ? 40 : 24,
                  offset: const Offset(0, 8),
                ),
                // Inner Top Glow (simulate light hitting top edge)
                BoxShadow(
                  color: Colors.white.withOpacity(0.10),
                  offset: const Offset(0, 1),
                  blurRadius: 0,
                  spreadRadius: 0,
                  blurStyle: BlurStyle.inner,
                ),
              ]
            : [],
      ),
      child: buttonContent,
    );

    // Apply Backdrop Filter for Secondary Glass
    if (widget.type == AtmosphericButtonType.secondaryGlass) {
      container = ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16), // 12px-20px blur
          child: container,
        ),
      );
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: isDisabled ? SystemMouseCursors.basic : SystemMouseCursors.click,
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        onTap: isDisabled ? null : widget.onPressed,
        child: AnimatedScale(
          scale: _isPressed && !isDisabled ? 0.98 : 1.0,
          duration: const Duration(milliseconds: 100),
          child: container,
        ),
      ),
    );
  }
}
