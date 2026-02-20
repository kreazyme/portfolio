import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  // Neobrutalist Color Palette
  static const brutalBlack = Color(0xFF000000);
  static const brutalWhite = Color(0xFFFFFFFF);
  static const primaryPurple = Color(0xFF6B21A8);
  static const backgroundLight = Color(0xFFF5F5DC);
  static const backgroundDark = Color(0xFF1A0033);
  static const cardDark = Color(0xFF4A0080);

  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: backgroundLight,
    colorScheme: ColorScheme.light(
      primary: primaryPurple,
      surface: brutalWhite,
      background: backgroundLight,
      onPrimary: brutalWhite,
      onSurface: brutalBlack,
    ),
    textTheme: GoogleFonts.spaceGroteskTextTheme().apply(
      bodyColor: brutalBlack,
      displayColor: brutalBlack,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: brutalBlack,
        foregroundColor: brutalWhite,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: brutalBlack, width: 2),
        ),
      ),
    ),
    cardTheme: CardThemeData(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        side: BorderSide(color: brutalBlack, width: 4),
      ),
    ),
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: backgroundDark,
    colorScheme: ColorScheme.dark(
      primary: primaryPurple,
      surface: cardDark,
      background: backgroundDark,
      onPrimary: brutalWhite,
      onSurface: brutalWhite,
    ),
    textTheme: GoogleFonts.spaceGroteskTextTheme().apply(
      bodyColor: brutalWhite,
      displayColor: brutalWhite,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: brutalWhite,
        foregroundColor: brutalBlack,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: brutalWhite, width: 2),
        ),
      ),
    ),
    cardTheme: CardThemeData(
      elevation: 0,
      color: cardDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        side: BorderSide(color: brutalWhite, width: 4),
      ),
    ),
  );

  // Neobrutalist Shadows
  static List<BoxShadow> brutalShadow(bool isDark) => [
    BoxShadow(
      color: isDark ? brutalWhite : brutalBlack,
      offset: const Offset(4, 4),
      blurRadius: 0,
    ),
  ];

  static List<BoxShadow> brutalShadowLarge(bool isDark) => [
    BoxShadow(
      color: isDark ? brutalWhite : brutalBlack,
      offset: const Offset(8, 8),
      blurRadius: 0,
    ),
  ];
}
