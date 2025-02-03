import 'package:flutter/material.dart';
import 'package:movies_app/app_resources/app_colors.dart';
import 'package:movies_app/app_resources/app_text_theme.dart';

AppBarTheme appBarTheme = AppBarTheme(
  backgroundColor: AppColors.backgroundColor,
  iconTheme: const IconThemeData(color: AppColors.primaryColor),
  centerTitle: true,
  titleTextStyle: labelMedium
);