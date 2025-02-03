import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/app_resources/app_colors.dart';

TextStyle headlineLarge = GoogleFonts.inter(
    fontSize: 36, fontWeight: FontWeight.w500, color: AppColors.textColor);

TextStyle headlineSmall = GoogleFonts.inter(
    fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textColor);

TextStyle bodyLarge = GoogleFonts.inter(
    fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.textColor);

TextStyle bodyMedium = GoogleFonts.inter(
    fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.textColor);

TextStyle labelLarge = GoogleFonts.inter(
    fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.primaryColor);

TextStyle labelMedium = GoogleFonts.inter(
    fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.primaryColor);
TextTheme textTheme = TextTheme(
    headlineLarge: headlineLarge,
    headlineSmall: headlineSmall,
    bodyLarge: bodyLarge,
    bodyMedium: bodyMedium,
    labelLarge: labelLarge,
    labelMedium: labelMedium);
