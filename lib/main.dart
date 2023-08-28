import 'package:arkham_horror_lcg_calculator/presentation/pages/calculator_page.dart';
import 'package:arkham_horror_lcg_calculator/presentation/themes/app_colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arkham Horror Calculator',
      theme: ThemeData(
          scaffoldBackgroundColor: AppColors.scaffoldColor,
          buttonTheme: ButtonThemeData(buttonColor: AppColors.secondaryColor),
          appBarTheme: AppBarTheme(color: AppColors.primaryColor),
          textTheme: Theme.of(context).textTheme.apply(
              bodyColor: AppColors.secondaryColor, fontFamily: 'Birmingham')),
      home: const CalculatorPage(),
    );
  }
}
