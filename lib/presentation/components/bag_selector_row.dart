import 'package:arkham_horror_lcg_calculator/domain/token.dart';
import 'package:arkham_horror_lcg_calculator/presentation/components/arrow_button.dart';
import 'package:arkham_horror_lcg_calculator/presentation/components/assets/app_images.dart';
import 'package:arkham_horror_lcg_calculator/presentation/components/assets/app_ui.dart';
import 'package:flutter/material.dart';

class BagSelectorRow extends StatefulWidget {
  final Token token;
  final int initialCount;
  final Function(int) onCountChanged;
  const BagSelectorRow(
      {Key? key,
      required this.token,
      required this.onCountChanged,
      required this.initialCount})
      : super(key: key);

  @override
  State<BagSelectorRow> createState() => _BagSelectorRowState();
}

class _BagSelectorRowState extends State<BagSelectorRow> {
  late int count;

  @override
  void initState() {
    super.initState();
    count = widget.initialCount;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    child: ArrowButton(
                        direction: ArrowDirection.left,
                        size: 64.0,
                        onPressed: () => {
                              setState(() {
                                count = (count - 1).clamp(0, 99);
                                widget.onCountChanged(count);
                              })
                            }),
                  ),
                ),
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Image(image: AppImages.token(widget.token.name))),
                )
              ],
            ),
          ),
          Expanded(
            flex: 0,
            child: Container(
                width: 16,
                padding: EdgeInsets.symmetric(vertical: 4),
                child: AppUI.divider_vertical),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: Text(
                      count.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 76),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: ArrowButton(
                        direction: ArrowDirection.right,
                        size: 64.0,
                        onPressed: () => {
                              setState(() {
                                count = (count + 1).clamp(0, 99);
                                widget.onCountChanged(count);
                              })
                            }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
