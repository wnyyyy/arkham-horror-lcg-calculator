import 'package:arkham_horror_lcg_calculator/domain/chaos_bag.dart';
import 'package:arkham_horror_lcg_calculator/domain/token.dart';
import 'package:arkham_horror_lcg_calculator/presentation/components/assets/app_icons.dart';
import 'package:arkham_horror_lcg_calculator/presentation/components/assets/app_images.dart';
import 'package:arkham_horror_lcg_calculator/presentation/components/assets/app_ui.dart';
import 'package:arkham_horror_lcg_calculator/presentation/components/number_selector.dart';
import 'package:arkham_horror_lcg_calculator/presentation/components/token_grid.dart';
import 'package:arkham_horror_lcg_calculator/presentation/pages/bag_selector_page.dart';
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
    _updateWinningTokenSet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
                onPressed: () => {
                      setState(() {
                        nonNegativeAllowed = !nonNegativeAllowed;
                        _updateNonNegativeTokens();
                        _updateProbability();
                      })
                    },
                icon:
                    nonNegativeAllowed ? AppIcons.plus : AppIcons.plusCrossed),
            IconButton(
                onPressed: () => {
                      setState(() {
                        signsAllowed = !signsAllowed;
                        _updateSignTokens();
                        _updateProbability();
                      })
                    },
                icon: signsAllowed ? AppIcons.sign : AppIcons.signCrossed)
          ],
        ),
        actions: [
          IconButton(
              onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BagSelectorPage()),
                    ).then((value) {
                      _updateProbability();
                    })
                  },
              icon: AppIcons.chaosBag)
        ],
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
                    _updateWinningTokenSet();
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
    });
  }

  void _updateNonNegativeTokens() {
    if (!nonNegativeAllowed) {
      winningTokenSet.removeWhere((token) =>
          (token is NumberToken && token.value >= 0) ||
          token.name == SignType.elderSign.name);
    } else {
      winningTokenSet
          .addAll(ChaosBag.numbers.where((token) => token.value + skill >= 0));
      winningTokenSet.add(ChaosBag.signs
          .where((token) => token.name == SignType.elderSign.name)
          .first);
    }
  }

  void _updateSignTokens() {
    if (!signsAllowed) {
      winningTokenSet
          .removeWhere((token) => (token is SignToken && !token.special));
    } else {
      winningTokenSet.addAll(ChaosBag.signs.where((token) => !token.special));
    }
  }

  void _updateWinningTokenSet() {
    winningTokenSet = Set();
    _updateNonNegativeTokens();
    _updateSignTokens();
    winningTokenSet.addAll(ChaosBag.numbers
        .where((token) => token.value < 0 && token.value + skill >= 0));

    _updateProbability();
  }
}
