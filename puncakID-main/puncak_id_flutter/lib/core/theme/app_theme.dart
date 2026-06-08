import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puncak_id/core/constants/app_constants.dart';

/// AppTheme - Mengonversi Design DNA "Atmospheric Ascent" ke ThemeData Flutter
class AppTheme {
  AppTheme._();

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.midnightSky,
      
      // Konfigurasi Skema Warna Global
      colorScheme: const ColorScheme.dark(
        primary: AppColors.forestGreen,
        secondary: AppColors.emeraldCanopy,
        tertiary: AppColors.sunsetAmber,
        surface: AppColors.surfaceContainer,
        background: AppColors.midnightSky,
      ),

      // Implementasi Aturan "No-Line" pada Elemen Card
      cardTheme: const CardThemeData(
        color: AppColors.surfaceContainer,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppRadiuses.xl)),
          side: BorderSide.none, // Melarang border 1px solid
        ),
      ),

      // Implementasi Aturan "No-Line" pada Form Input (Hanya Efek Glow Bawah)
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceContainerLow,
        border: const UnderlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppRadiuses.md)),
          borderSide: BorderSide.none,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.sunsetAmber,
            width: 2.0, // Efek glow fungsional di bagian bawah saja
          ),
        ),
        labelStyle: GoogleFonts.inter(color: AppColors.textSecondary),
      ),

      // Konfigurasi Tipografi Asimetris High-Contrast
      textTheme: TextTheme(
        displayLarge: GoogleFonts.plusJakartaSans(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          letterSpacing: -0.64, // -0.02em untuk kesan modern & otoritatif
          color: AppColors.textPrimary,
        ),
        headlineLarge: GoogleFonts.plusJakartaSans(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.48,
          color: AppColors.textPrimary,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: AppColors.textPrimary,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 14,
          color: AppColors.textSecondary,
        ),
        labelSmall: GoogleFonts.inter(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5, // Uppercase label style
          color: AppColors.sunsetAmber,
        ),
      ),
    );
  }
}