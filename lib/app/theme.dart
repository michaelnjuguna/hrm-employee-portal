import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_tailwind_colors/flutter_tailwind_colors.dart';

class FilamentTheme {
  // Filament cyan accent colors
  static Color filamentCyan = TWColors.cyan.shade500; // cyan-500
  static Color filamentCyanDark = TWColors.cyan.shade600; // cyan-600

  // Neutral greys for primary
  static Color lightPrimary = TWColors.gray.shade50;
  static Color darkPrimary = TWColors.gray.shade900;

  // 🌞 LIGHT THEME
  static final ThemeData light = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: lightPrimary,
      onPrimary: Colors.black87,
      secondary: const Color(0xFFF1F5F9), // slate-100
      onSecondary: Colors.black87,
      tertiary: filamentCyan,
      onTertiary: Colors.white,
      error: Colors.red.shade700,
      onError: Colors.white,
      surface: Colors.white,
      onSurface: Colors.black87,
    ),
    scaffoldBackgroundColor: lightPrimary,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black87,
      elevation: 0,
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: filamentCyan,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 0,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: filamentCyan),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: filamentCyan),
      ),
    ),
    textTheme: GoogleFonts.interTextTheme().apply(
      bodyColor: Colors.black87,
      displayColor: Colors.black87,
    ),
  );

  // 🌚 DARK THEME
  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: darkPrimary,
      onPrimary: Colors.white,
      secondary: const Color(0xFF1E293B), // slate-800
      onSecondary: Colors.white,
      tertiary: filamentCyanDark,
      onTertiary: Colors.white,
      error: Colors.red.shade400,
      onError: Colors.black,
      surface: const Color(0xFF1E293B),
      onSurface: Colors.white,
    ),
    scaffoldBackgroundColor: darkPrimary,
    appBarTheme: AppBarTheme(
      backgroundColor: darkPrimary,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    cardTheme: CardThemeData(
      color: const Color(0xFF1E293B),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: filamentCyanDark,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 0,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: filamentCyan),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF1E293B),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFF334155)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: filamentCyan),
      ),
    ),
    textTheme: GoogleFonts.interTextTheme().apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),
  );
}
