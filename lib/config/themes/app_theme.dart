import 'package:clean_arch/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';

ThemeData appTheme() {
  return ThemeData(
      primaryColor: AppColors.primary,
      hintColor: AppColors.hint,
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          color: Colors.transparent,
          elevation: 0.0,
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 20.0)),
      scaffoldBackgroundColor: Colors.white,
      textTheme: const TextTheme(
          bodyMedium: TextStyle(
              height: 1.3,
              color: Colors.white,
              fontSize: 22.0,
              fontWeight: FontWeight.bold),
          // labelLarge: TextStyle(
          //     fontSize: 16.0,
          //     color: Colors.black,
          //     fontWeight: FontWeight.w500)
      ),
      fontFamily: AppStrings.fontFamily);
}
