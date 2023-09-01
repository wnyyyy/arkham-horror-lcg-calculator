import 'package:arkham_horror_lcg_calculator/presentation/components/arrow_button.dart';
import 'package:arkham_horror_lcg_calculator/presentation/components/sign_toggle.dart';
import 'package:flutter/material.dart';

class NumberSelector extends StatefulWidget {
  final Function(int) onNumberChanged;
  final int startingNumber;

  const NumberSelector(
      {Key? key, required this.onNumberChanged, required this.startingNumber})
      : super(key: key);

  @override
  State<NumberSelector> createState() => _NumberSelectorState();
}

class _NumberSelectorState extends State<NumberSelector> {
  late int selectedNumber;
  bool isPositive = true;

  @override
  void initState() {
    super.initState();
    selectedNumber = widget.startingNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
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
                          widget.onNumberChanged(_getNumber());
                        });
                      }),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(bottom: 48),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${selectedNumber.abs()}',
                    overflow: TextOverflow.ellipsis,
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ArrowButton(
                      direction: ArrowDirection.up,
                      size: 64.0,
                      onPressed: () => {
                            setState(() {
                              selectedNumber++;
                              selectedNumber = selectedNumber.clamp(-99, 99);
                              if (selectedNumber >= 0) {
                                isPositive = true;
                              }
                              widget.onNumberChanged(_getNumber());
                            })
                          }),
                  ArrowButton(
                      direction: ArrowDirection.up,
                      size: 64.0,
                      onPressed: () => {
                            setState(() {
                              selectedNumber += 3;
                              selectedNumber = selectedNumber.clamp(-99, 99);
                              if (selectedNumber >= 0) {
                                isPositive = true;
                              }
                              widget.onNumberChanged(_getNumber());
                            })
                          },
                      doubleArrow: true),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ArrowButton(
                      direction: ArrowDirection.down,
                      size: 64.0,
                      onPressed: () => {
                            setState(() {
                              selectedNumber -= 1;
                              selectedNumber = selectedNumber.clamp(-99, 99);
                              if (selectedNumber < 0) {
                                isPositive = false;
                              }
                              widget.onNumberChanged(_getNumber());
                            })
                          }),
                  ArrowButton(
                      direction: ArrowDirection.down,
                      size: 64.0,
                      onPressed: () => {
                            setState(() {
                              selectedNumber -= 3;
                              selectedNumber = selectedNumber.clamp(-99, 99);
                              if (selectedNumber < 0) {
                                isPositive = false;
                              }
                              widget.onNumberChanged(_getNumber());
                            })
                          },
                      doubleArrow: true),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  int _getNumber() {
    return selectedNumber.abs() * (isPositive ? 1 : -1);
  }
}
