import 'package:arkham_horror_lcg_calculator/presentation/themes/app_colors.dart';
import 'package:flutter/material.dart';

class BagSelectorPage extends StatefulWidget {
  const BagSelectorPage({super.key});

  @override
  State<BagSelectorPage> createState() => _BagSelectorPageState();
}

class _BagSelectorPageState extends State<BagSelectorPage> {
  int totalProbability = 0;

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
          onPressed: () =>
              Navigator.of(context).pop(), // This will navigate back
        ),
        actions: [
          IconButton(
              onPressed: () => {Navigator.of(context).pop()},
              icon: Icon(
                Icons.check,
                color: AppColors.secondaryColor,
                size: 48,
              )),
        ],
      ),
      body: SizedBox(),
    );
  }
}
