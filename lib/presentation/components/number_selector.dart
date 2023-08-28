import 'package:arkham_horror_lcg_calculator/domain/enums.dart';
import 'package:arkham_horror_lcg_calculator/presentation/components/arrow_button.dart';
import 'package:arkham_horror_lcg_calculator/presentation/components/sign_toggle.dart';
import 'package:flutter/material.dart';

class NumberSelector extends StatefulWidget {
  const NumberSelector({Key? key}) : super(key: key);

  @override
  State<NumberSelector> createState() => _NumberSelectorState();
}

class _NumberSelectorState extends State<NumberSelector> {
  int selectedNumber = 2;
  bool isPositive = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent),
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: SignToggle(
                        isPositive: isPositive,
                        onChanged: (value) {
                          setState(() {
                            isPositive = value;
                          });
                        }),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(bottom: 48),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)),
                    child: Text(
                      '$selectedNumber',
                      style: TextStyle(fontSize: 96.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ArrowButton(
                        direction: ArrowDirection.up,
                        onPressed: () => {
                              setState(() {
                                selectedNumber++;
                              })
                            }),
                    ArrowButton(
                        direction: ArrowDirection.up,
                        onPressed: () => {
                              setState(() {
                                selectedNumber += 3;
                              })
                            },
                        doubleArrow: true),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ArrowButton(
                        direction: ArrowDirection.down,
                        onPressed: () => {
                              setState(() {
                                selectedNumber =
                                    selectedNumber > 0 ? selectedNumber - 1 : 0;
                              })
                            }),
                    ArrowButton(
                        direction: ArrowDirection.down,
                        onPressed: () => {
                              setState(() {
                                selectedNumber =
                                    selectedNumber > 2 ? selectedNumber - 3 : 0;
                              })
                            },
                        doubleArrow: true),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
