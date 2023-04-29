import 'package:clean_arch/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';

ThemeData appTheme() {
  return ThemeData(
      primaryColor: AppColors.primary,
      hintColor: AppColors.hint,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: AppStrings.fontFamily);
}
