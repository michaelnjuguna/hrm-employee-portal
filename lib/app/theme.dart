import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const lightSeedColor = Color(0xFF38BCFF);
  static const darkSeedColor = Color(0xFF2B84D0);

  static final _elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  );
  static final _inputDecorationTheme = InputDecorationTheme(
    // filled: false,
    // isDense: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 0),
  );
  static final light = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: lightSeedColor,
      brightness: Brightness.light,
    ),
    textTheme: GoogleFonts.lexendTextTheme(),
    elevatedButtonTheme: _elevatedButtonTheme,
    inputDecorationTheme: _inputDecorationTheme,
  );

  static final dark = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: darkSeedColor,
      brightness: Brightness.dark,
    ),
    textTheme: GoogleFonts.lexendTextTheme(ThemeData.dark().textTheme),
    elevatedButtonTheme: _elevatedButtonTheme,
    inputDecorationTheme: _inputDecorationTheme,
  );
}
