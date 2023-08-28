import 'package:arkham_horror_lcg_calculator/presentation/components/assets/app_icons.dart';
import 'package:arkham_horror_lcg_calculator/presentation/components/assets/app_images.dart';
import 'package:arkham_horror_lcg_calculator/presentation/components/assets/app_ui.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  int _totalProbability = 0;

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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  _totalProbability.toString() + "%",
                  style: TextStyle(fontSize: 96.0),
                ),
              ),
              Expanded(child: AppUI.divider),
              Expanded(child: SizedBox())
            ],
          )),
          Expanded(
              child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AppImages.tokenBackground, fit: BoxFit.fill)),
            ),
            Column(children: [
              SizedBox(
                height: 3,
              ),
              Expanded(child: AppUI.divider),
            ])
          ]))
        ],
      ),
    );
  }
}
