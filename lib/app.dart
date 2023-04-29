import 'package:clean_arch/config/themes/app_theme.dart';
import 'package:clean_arch/core/utils/app_colors.dart';
import 'package:clean_arch/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

import 'feature/random_qoute/presentation/screens/quote_screen.dart';

class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: appTheme(),
      home: const QuoteScreen(),
    );
  }
}
