import 'package:flutter/material.dart';
import 'package:pebble_pharmacy/customization/theme/colors.dart';
import 'package:pebble_pharmacy/customization/theme/colorscheme.dart';

ThemeData appTheme = ThemeData(
  fontFamily: "Montserrat",
  colorScheme: appLightMode,
  primaryColor: AppColors.deepPurple,
  scaffoldBackgroundColor: AppColors.white,
  textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1).copyWith(
    bodyLarge: TextStyle(fontFamily: "Montserrat"),
    bodyMedium: TextStyle(fontFamily: "Montserrat"),
    bodySmall: TextStyle(fontFamily: "Montserrat"),
    displayLarge: TextStyle(fontFamily: "Montserrat"),
    displayMedium: TextStyle(fontFamily: "Montserrat"),
    displaySmall: TextStyle(fontFamily: "Montserrat"),
    headlineLarge: TextStyle(fontFamily: "Montserrat"),
    headlineMedium: TextStyle(fontFamily: "Montserrat"),
    headlineSmall: TextStyle(fontFamily: "Montserrat"),
    titleLarge: TextStyle(fontFamily: "Montserrat"),
    titleMedium: TextStyle(fontFamily: "Montserrat"),
    titleSmall: TextStyle(fontFamily: "Montserrat"),
    labelLarge: TextStyle(fontFamily: "Montserrat"),
    labelMedium: TextStyle(fontFamily: "Montserrat"),
    labelSmall: TextStyle(fontFamily: "Montserrat"),
  ),
);