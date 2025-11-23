import 'package:flutter/material.dart';
import 'package:financial_planner_pro/core/constants/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const String fontFamily = 'SF Pro';
  
  // Display
  static const displayLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    height: 1.2,
    color: AppColors.textPrimary,
  );
  
  // Headings
  static const h1 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );
  
  static const h2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );
  
  static const h3 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );
  
  // Body
  static const bodyLarge = TextStyle(
    fontSize: 16,
    height: 1.5,
    color: AppColors.textPrimary,
  );
  
  static const bodyMedium = TextStyle(
    fontSize: 14,
    height: 1.5,
    color: AppColors.textPrimary,
  );
  
  static const bodySmall = TextStyle(
    fontSize: 12,
    height: 1.4,
    color: AppColors.textSecondary,
  );
  
  // Special
  static const caption = TextStyle(
    fontSize: 12,
    color: AppColors.textSecondary,
  );
  
  static const overline = TextStyle(
    fontSize: 10,
    letterSpacing: 1.5,
    color: AppColors.textTertiary,
  );
  
  static const kpiAmount = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );
}
