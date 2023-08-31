import 'package:arkham_horror_lcg_calculator/domain/chaos_bag.dart';
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
  int totalProbability = 0;

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
                    totalProbability.toString() + "%",
                    style: TextStyle(fontSize: 128.0),
                  ),
                ),
                AppUI.divider,
                NumberSelector(),
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
                  child: TokenGrid(tokens: ChaosBag.unique),
                )
              ],
            ),
          ]))
        ],
      ),
    );
  }
}
