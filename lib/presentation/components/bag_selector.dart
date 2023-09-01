import 'package:arkham_horror_lcg_calculator/domain/chaos_bag.dart';
import 'package:arkham_horror_lcg_calculator/domain/token.dart';
import 'package:arkham_horror_lcg_calculator/presentation/components/bag_selector_row.dart';
import 'package:flutter/material.dart';

class BagSelector extends StatefulWidget {
  final Map<Token, int> tokenCounts;
  final Function(int) updateCount;
  const BagSelector({
    Key? key,
    required this.tokenCounts,
    required this.updateCount,
  }) : super(key: key);

  @override
  State<BagSelector> createState() => _BagSelectorState();
}

class _BagSelectorState extends State<BagSelector> {
  int currCount = ChaosBag.tokens.length;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scrollbar(
        child: ListView.builder(
          itemCount: widget.tokenCounts.length,
          itemBuilder: (context, index) {
            Token token = widget.tokenCounts.keys.elementAt(index);
            return _buildRow(
              token,
              widget.tokenCounts[token]!,
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
          if (widget.tokenCounts[token]! > value) {
            currCount--;
          } else {
            currCount++;
          }
          widget.updateCount(currCount);
          widget.tokenCounts[token] = value;
        });
      },
    );
  }
}
