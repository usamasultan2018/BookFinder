import 'package:bookfinder/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.lightBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.buttonText,
      elevation: 0,
      centerTitle: true,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.headingLight),
      titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.textLight),
      bodyLarge: TextStyle(fontSize: 16, color: AppColors.textLight),
    ),
    cardColor: AppColors.cardLight,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonBackground,
        foregroundColor: AppColors.buttonText,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    dividerColor: AppColors.divider,
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: AppColors.primaryDark,
    scaffoldBackgroundColor: AppColors.darkBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryDark,
      foregroundColor: AppColors.buttonText,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.headingDark),
      bodyLarge: TextStyle(fontSize: 16, color: AppColors.textDark),
    ),
    cardColor: AppColors.cardDark,
    dividerColor: AppColors.divider,
  );
}
