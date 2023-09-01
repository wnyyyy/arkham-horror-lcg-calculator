import 'package:arkham_horror_lcg_calculator/domain/chaos_bag.dart';
import 'package:arkham_horror_lcg_calculator/presentation/components/assets/app_icons.dart';
import 'package:arkham_horror_lcg_calculator/presentation/components/assets/app_ui.dart';
import 'package:arkham_horror_lcg_calculator/presentation/components/bag_selector.dart';
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
          onPressed: () => Navigator.of(context).pop(),
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
                      ChaosBag.tokens.length.toString(),
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
                  child: BagSelector())),
        ],
      ),
    );
  }
}
