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
  List<Token> allowedList = ChaosBag.allowedTokens.toList();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scrollbar(
        child: ListView.builder(
          itemCount: allowedList.length,
          itemBuilder: (context, index) {
            return _buildRow(allowedList.elementAt(index));
          },
        ),
      ),
    );
  }

  Widget _buildRow(Token token) {
    return BagSelectorRow(token: token, onCountChanged: (value) => {});
  }
}
