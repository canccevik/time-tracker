import 'package:flutter/material.dart';
import 'package:time_tracker/presentation/constants/colors.dart';

class AppThemes {
  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: AppColors.primarySwatch,
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
      cardColor: AppColors.cardColor,

      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.appBarBackgroundColor
      ),

      iconTheme: const IconThemeData(color: AppColors.defaultIconColor),
      primaryIconTheme: const IconThemeData(color: AppColors.primaryIconColor),

      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 22,
          color: Colors.black,
          fontWeight: FontWeight.w500
        ),
        bodyMedium: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16
        ),
        displayLarge: TextStyle(
          fontSize: 60,
          fontWeight: FontWeight.bold,
          color: Colors.black
        ),
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.black
        ),
        labelLarge: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 13
        ),
      )
    );
  }
}
