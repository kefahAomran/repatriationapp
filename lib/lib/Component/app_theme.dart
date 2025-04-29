import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

ThemeData themeEnglish = ThemeData(
  // colorScheme: ColorScheme.fromSeed(seedColor:color_bar_icons),
    progressIndicatorTheme: ProgressIndicatorThemeData(color: AppColors.primary),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.white
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.manrope(
        fontSize: 97,
        fontWeight: FontWeight.w300,
      ),
      displayMedium: GoogleFonts.manrope(
        fontSize: 61,
        fontWeight: FontWeight.w300,
      ),
      displaySmall: GoogleFonts.manrope(fontSize: 48, fontWeight: FontWeight.w400),
      headlineMedium: GoogleFonts.manrope(
        fontSize: 34,
        fontWeight: FontWeight.w400,
      ),
      headlineSmall:
      GoogleFonts.manrope(fontSize: 24, fontWeight: FontWeight.w500),
      titleLarge: GoogleFonts.manrope(
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: GoogleFonts.manrope(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: GoogleFonts.manrope(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: GoogleFonts.manrope(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: GoogleFonts.manrope(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: GoogleFonts.manrope(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: GoogleFonts.manrope(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),

    ),


  // primarySwatch: AppColors.primary,
);

ThemeData themeArabic = ThemeData(
  // colorScheme: ColorScheme.fromSeed(seedColor:color_bar_icons ),
  progressIndicatorTheme: ProgressIndicatorThemeData(color: AppColors.primary),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
      backgroundColor: Colors.white
  ),
  textTheme: TextTheme(
    displayLarge: GoogleFonts.almarai(
      fontSize: 97,
      fontWeight: FontWeight.w300,
    ),
    displayMedium: GoogleFonts.almarai(
      fontSize: 61,
      fontWeight: FontWeight.w300,
    ),
    displaySmall:
    GoogleFonts.almarai(fontSize: 48, fontWeight: FontWeight.w400),
    headlineMedium: GoogleFonts.almarai(
      fontSize: 34,
      fontWeight: FontWeight.w400,
    ),
    headlineSmall:
    GoogleFonts.almarai(fontSize: 24, fontWeight: FontWeight.w400),
    titleLarge: GoogleFonts.almarai(
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    titleMedium: GoogleFonts.almarai(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    titleSmall: GoogleFonts.almarai(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: GoogleFonts.almarai(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: GoogleFonts.almarai(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    labelLarge: GoogleFonts.almarai(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    bodySmall: GoogleFonts.almarai(
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
    labelSmall: GoogleFonts.almarai(
      fontSize: 10,
      fontWeight: FontWeight.w400,
    ),
  ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: Colors.grey[300]!),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: Colors.grey[300]!),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: const BorderSide(color: AppColors.primary),
      ),
    )
);
