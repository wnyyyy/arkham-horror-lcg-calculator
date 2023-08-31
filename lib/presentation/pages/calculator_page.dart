import 'package:arkham_horror_lcg_calculator/domain/chaos_bag.dart';
import 'package:arkham_horror_lcg_calculator/domain/token.dart';
import 'package:arkham_horror_lcg_calculator/presentation/components/assets/app_icons.dart';
import 'package:arkham_horror_lcg_calculator/presentation/components/assets/app_images.dart';
import 'package:arkham_horror_lcg_calculator/presentation/components/assets/app_ui.dart';
import 'package:arkham_horror_lcg_calculator/presentation/components/number_selector.dart';
import 'package:arkham_horror_lcg_calculator/presentation/components/token_grid.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  late double totalProbability;
  int skill = 2;
  bool signsAllowed = false;
  bool nonNegativeAllowed = true;
  Set<Token> winningTokenSet = Set();

  @override
  void initState() {
    super.initState();
    _updateProbability();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(onPressed: () => {}, icon: AppIcons.plus),
                IconButton(onPressed: () => {}, icon: AppIcons.sign)
              ],
            ),
            IconButton(onPressed: () => {}, icon: AppIcons.chaosBag)
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 128,
                  child: Text(
                    totalProbability.round().toString() + '%',
                    style: TextStyle(fontSize: 128.0),
                  ),
                ),
                AppUI.divider,
                NumberSelector(
                  onNumberChanged: (num) {
                    skill = num;
                    _updateWinningTokenSetFromSkill();
                  },
                  startingNumber: skill,
                ),
              ],
            ),
          ),
          Expanded(
              child: Stack(children: [
            Transform.translate(
              offset: Offset(0, 3.5),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AppImages.tokenBackground, fit: BoxFit.fill)),
              ),
            ),
            Column(
              children: [
                AppUI.divider,
                Expanded(
                  child: TokenGrid(
                      tokens: ChaosBag.unique,
                      winningTokens: winningTokenSet,
                      onTapToken: (token) => {
                            setState(() {
                              if (winningTokenSet.contains(token)) {
                                winningTokenSet.remove(token);
                              } else {
                                winningTokenSet.add(token);
                              }
                              _updateProbability();
                            })
                          }),
                )
              ],
            ),
          ]))
        ],
      ),
    );
  }

  void _updateProbability() {
    List<Token> winningTokens = ChaosBag.tokens
        .where((token) => winningTokenSet.contains(token))
        .toList();
    int tokenCount = ChaosBag.tokens.length;
    setState(() {
      this.totalProbability = winningTokens.length / tokenCount * 100;
      this.winningTokenSet = winningTokens.toSet();
    });
  }

  void _updateWinningTokenSetFromSkill() {
    List<Token> winningTokens = [];
    List<NumberToken> winningNumberTokens =
        ChaosBag.numbers.where((token) => token.value + skill >= 0).toList();
    if (nonNegativeAllowed) {
      winningTokens.addAll(ChaosBag.signs
          .where((token) => token.name == SignType.elderSign.name));
    } else {
      winningNumberTokens.removeWhere((token) => token.value >= 0);
    }
    winningTokens.addAll(winningNumberTokens);
    if (signsAllowed) {
      winningTokens
          .addAll(ChaosBag.signs.where((token) => !token.special).toList());
    }
    winningTokenSet = winningTokens.toSet();

    _updateProbability();
  }
}
