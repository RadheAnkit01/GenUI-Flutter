import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.light(
      primary: const Color(0xFF2563EB),
      secondary: const Color(0xFF10B981),
      surface: Colors.white,
      error: const Color(0xFFEF4444),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.dark(
      primary: const Color(0xFF60A5FA),
      secondary: const Color(0xFF34D399),
      surface: const Color(0xFF1E1E1E),
      error: const Color(0xFFF87171),
    ),
  );
}
