import 'package:flutter/material.dart';

class AppTheme {
  ThemeData? theme() {
    return ThemeData(
      scaffoldBackgroundColor: const Color(0xFF2C1B2A),
      accentColor: const Color(0xFFA15A66),
      cardColor: const Color(0xFF1C1420),
      canvasColor: const Color(0xFF2C1B2A),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Color(0xFFFFFFFF),
        unselectedItemColor: Colors.white30,
      ),
    );
  }
}
