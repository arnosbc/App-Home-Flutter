import 'package:flutter/material.dart';

abstract final class Space {
  static const xs = 4.0;
  static const sm = 8.0;
  static const md = 16.0;
  static const lg = 24.0;
  static const xl = 32.0;
  static const xxl = 48.0;
}

abstract final class AppColors {
  static const forest = Color(0xFF12372A);
  static const fern = Color(0xFF4F8A68);
  static const mint = Color(0xFFE9F5DB);
  static const paper = Color(0xFFFFFCF4);
  static const coral = Color(0xFFE78161);
  static const peach = Color(0xFFF8E5C8);
  static const textMuted = Color(0xFF668071);
  static const divider = Color(0xFFDCE8DA);
  static const outline = Color(0xFFD5E4D2);
  static const shadow = Color(0x15203C2C);
}

ThemeData buildAppTheme() {
  final colorScheme =
      ColorScheme.fromSeed(
        seedColor: AppColors.forest,
        brightness: Brightness.light,
      ).copyWith(
        primary: AppColors.forest,
        onPrimary: Colors.white,
        secondary: AppColors.fern,
        onSurface: AppColors.forest,
      );

  return ThemeData(
    colorScheme: colorScheme,
    scaffoldBackgroundColor: AppColors.paper,
    useMaterial3: true,
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: AppColors.fern,
      labelStyle: const TextStyle(color: AppColors.textMuted),
      hintStyle: const TextStyle(color: AppColors.textMuted),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.textMuted, height: 1.5),
      bodyMedium: TextStyle(color: AppColors.textMuted),
      labelLarge: TextStyle(fontWeight: FontWeight.w700),
    ),
  );
}
