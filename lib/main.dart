import 'package:arkham_horror_lcg_calculator/data/chaos_bag_repository_impl.dart';
import 'package:arkham_horror_lcg_calculator/domain/chaos_bag.dart';
import 'package:arkham_horror_lcg_calculator/domain/chaos_bag_repository.dart';
import 'package:arkham_horror_lcg_calculator/domain/token.dart';
import 'package:arkham_horror_lcg_calculator/presentation/pages/calculator_page.dart';
import 'package:arkham_horror_lcg_calculator/presentation/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    Provider<ChaosBagRepository>(
      create: (context) => ChaosBagRepositoryImpl(),
      child: const ArkhamHorrorCalculator(),
    ),
  );
}

List<Token> _getDefaultChaosBag() {
  List<Token> tokens = [
    NumberToken(1),
    NumberToken(0),
    NumberToken(0),
    NumberToken(-1),
    NumberToken(-1),
    NumberToken(-1),
    NumberToken(-2),
    NumberToken(-2),
    NumberToken(-3),
    NumberToken(-4),
    SignToken(SignType.skull),
    SignToken(SignType.skull),
    SignToken(SignType.cultist),
    SignToken(SignType.autoFail),
    SignToken(SignType.elderSign),
  ];
  return tokens;
}

class ArkhamHorrorCalculator extends StatelessWidget {
  const ArkhamHorrorCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<ChaosBagRepository>(context);

    return MaterialApp(
      title: 'Arkham Horror Calculator',
      theme: ThemeData(
          scaffoldBackgroundColor: AppColors.scaffoldColor,
          buttonTheme: ButtonThemeData(buttonColor: AppColors.secondaryColor),
          appBarTheme: AppBarTheme(color: AppColors.primaryColor),
          textTheme: Theme.of(context).textTheme.apply(
              bodyColor: AppColors.secondaryColor, fontFamily: 'Birmingham')),
      home: FutureBuilder<List<Token>>(
        future: repository.get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError ||
                snapshot.data == null ||
                snapshot.data!.isEmpty) {
              ChaosBag.tokens = _getDefaultChaosBag();
              repository.save(ChaosBag.tokens);
            } else {
              ChaosBag.tokens = snapshot.data!;
            }
            return CalculatorPage();
          }
          return Container();
        },
      ),
    );
  }
}
