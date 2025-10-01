import 'package:chateo_eela_2025_2/app/core/ui/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData.from(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    ).copyWith(
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationThemeData(
        labelStyle: TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.normal,
          fontSize: 14,
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryLight),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryLight),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryLight),
        ),
      ),
    );
  }
}
