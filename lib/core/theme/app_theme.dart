import 'package:flutter/material.dart';
import '../widgets/app_colors.dart';
import 'app_bar_theme.dart';
import 'app_text_theme.dart';

ThemeData themeData = ThemeData(
    useMaterial3: true,
    appBarTheme: appBarTheme,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    textTheme: textTheme

);
