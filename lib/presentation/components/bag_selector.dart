import 'package:arkham_horror_lcg_calculator/domain/chaos_bag.dart';
import 'package:arkham_horror_lcg_calculator/domain/token.dart';
import 'package:arkham_horror_lcg_calculator/presentation/components/bag_selector_row.dart';
import 'package:flutter/material.dart';

class BagSelector extends StatefulWidget {
  const BagSelector({Key? key}) : super(key: key);

  @override
  State<BagSelector> createState() => _BagSelectorState();
}

class _BagSelectorState extends State<BagSelector> {
  late Map<Token, int> tokenCounts;

  @override
  void initState() {
    super.initState();
    tokenCounts = {};
    for (Token token in ChaosBag.allowedTokens) {
      tokenCounts[token] = ChaosBag.tokens.where((t) => t == token).length;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scrollbar(
        child: ListView.builder(
          itemCount: tokenCounts.length,
          itemBuilder: (context, index) {
            Token token = tokenCounts.keys.elementAt(index);
            return _buildRow(
              token,
              tokenCounts[token]!,
            );
          },
        ),
      ),
    );
  }

  Widget _buildRow(Token token, int count) {
    return BagSelectorRow(
      token: token,
      initialCount: count,
      onCountChanged: (value) {
        setState(() {
          tokenCounts[token] = value;
        });
      },
    );
  }
}
