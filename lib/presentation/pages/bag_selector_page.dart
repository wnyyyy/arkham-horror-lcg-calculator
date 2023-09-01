import 'package:arkham_horror_lcg_calculator/domain/chaos_bag.dart';
import 'package:arkham_horror_lcg_calculator/domain/chaos_bag_repository.dart';
import 'package:arkham_horror_lcg_calculator/domain/token.dart';
import 'package:arkham_horror_lcg_calculator/presentation/components/assets/app_icons.dart';
import 'package:arkham_horror_lcg_calculator/presentation/components/assets/app_ui.dart';
import 'package:arkham_horror_lcg_calculator/presentation/components/bag_selector.dart';
import 'package:arkham_horror_lcg_calculator/presentation/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BagSelectorPage extends StatefulWidget {
  const BagSelectorPage({super.key});

  @override
  State<BagSelectorPage> createState() => _BagSelectorPageState();
}

class _BagSelectorPageState extends State<BagSelectorPage> {
  late Map<Token, int> tokenCounts;
  late int currCount;
  late ChaosBagRepository repository;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    repository = Provider.of<ChaosBagRepository>(context);
  }

  @override
  void initState() {
    super.initState();
    tokenCounts = {};
    for (Token token in ChaosBag.allowedTokens) {
      tokenCounts[token] = ChaosBag.tokens.where((t) => t == token).length;
    }
    currCount = ChaosBag.tokens.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(),
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: AppColors.secondaryColor,
            size: 48,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
              padding: EdgeInsets.only(right: 32),
              onPressed: () => {_updateTokens(), Navigator.of(context).pop()},
              icon: Icon(
                Icons.check,
                color: AppColors.secondaryColor,
                size: 48,
              )),
        ],
      ),
      body: Column(
        children: [
          Column(children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(height: 96, width: 96, child: AppIcons.chaosBag),
                  Container(
                    padding: EdgeInsets.only(left: 24, right: 24, bottom: 24),
                    child: Text(
                      ':',
                      style: TextStyle(fontSize: 96.0),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Text(
                      currCount.toString(),
                      style: TextStyle(fontSize: 96),
                    ),
                  ),
                ],
              ),
            ),
            AppUI.divider,
          ]),
          Expanded(
              child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                          width: 2.0, color: AppColors.secondaryColor),
                      bottom: BorderSide(
                          width: 2.0, color: AppColors.secondaryColor),
                    ),
                  ),
                  child: BagSelector(
                    tokenCounts: tokenCounts,
                    updateCount: (count) {
                      setState(() {
                        currCount = count;
                      });
                    },
                  ))),
        ],
      ),
    );
  }

  void _updateTokens() {
    List<Token> tokens = [];
    for (Token token in tokenCounts.keys) {
      for (int i = 0; i < tokenCounts[token]!; i++) {
        tokens.add(token);
      }
    }
    repository.save(tokens);
    ChaosBag.tokens = tokens;
  }
}
