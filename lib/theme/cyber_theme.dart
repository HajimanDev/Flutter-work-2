import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CyberColors {
  static const yellow = Color(0xFFFCEE0A);
  static const black = Color(0xFF000000);
  static const dark = Color(0xFF0F0F0F);
  static const cyan = Color(0xFF00F0FF);
  static const red = Color(0xFFFF003C);
  static const grey = Color(0xFF6B6B6B);
}

class CyberTheme {
  static ThemeData get theme => ThemeData(
        scaffoldBackgroundColor: CyberColors.yellow,
        colorScheme: const ColorScheme.light(
          primary: CyberColors.black,
          secondary: CyberColors.cyan,
          surface: CyberColors.yellow,
          onPrimary: CyberColors.yellow,
          onSecondary: CyberColors.black,
        ),
        textTheme: GoogleFonts.shareTechMonoTextTheme().apply(
          bodyColor: CyberColors.black,
          displayColor: CyberColors.black,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: CyberColors.black,
          foregroundColor: CyberColors.yellow,
          elevation: 0,
          centerTitle: false,
          titleTextStyle: GoogleFonts.rajdhani(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: CyberColors.yellow,
            letterSpacing: 2,
          ),
        ),
      );
}