import 'package:clean_arch/config/routes/app_routes.dart';
import 'package:clean_arch/config/themes/app_theme.dart';
import 'package:clean_arch/core/utils/app_strings.dart';
import 'package:flutter/material.dart';


class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: appTheme(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
