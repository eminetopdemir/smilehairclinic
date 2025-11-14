import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color navy = Color(0xFF041C2C);
  static const Color navyDark = Color(0xFF031725);
  static const Color card = Color(0xFF09263A);
  static const Color accent = Color(0xFF00E5C1); // neon turquoise
  static const Color turquoise = Color(0xFF19CFE1);
}

class AppTheme {
  static ThemeData get darkTheme {
    final base = ThemeData.dark();
    return base.copyWith(
      scaffoldBackgroundColor: AppColors.navy,
      colorScheme: base.colorScheme.copyWith(
        primary: AppColors.accent,
        secondary: AppColors.turquoise,
        surface: AppColors.card,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(base.textTheme)
          .apply(bodyColor: Colors.white, displayColor: Colors.white),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.navyDark,
        selectedItemColor: AppColors.accent,
        unselectedItemColor: Colors.white70,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
      ),
      cardTheme: const CardThemeData(
        color: AppColors.card,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        elevation: 0,
      ),
    );
  }

  static BoxDecoration gradientBg = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFF051C2C), Color(0xFF062C33), Color(0xFF0A2F36)],
    ),
  );
}
