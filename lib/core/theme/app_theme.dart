// lib/core/theme/app_theme.dart
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/fonts.dart';

class AppTheme {
  static final ThemeData light = ThemeData(
    fontFamily: AppFonts.urdu,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    cardColor: AppColors.card,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: AppColors.textDark, fontSize: 16),
      bodySmall: TextStyle(color: AppColors.textLight, fontSize: 14),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.secondary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );

  static final ThemeData dark = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black,
    primaryColor: AppColors.primary,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
    ),
  );
}
