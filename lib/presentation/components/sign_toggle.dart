import 'package:arkham_horror_lcg_calculator/presentation/themes/app_colors.dart';
import 'package:flutter/material.dart';

class SignToggle extends StatelessWidget {
  final bool isPositive;
  final ValueChanged<bool> onChanged;

  const SignToggle({
    required this.isPositive,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () => onChanged(!isPositive),
        child: Container(
          padding: EdgeInsets.only(bottom: 32.0, top: 16.0),
          alignment: Alignment.center,
          child: Column(
            children: [
              _signText('+', isPositive, Colors.lightGreen),
              _signText('-', !isPositive, Colors.red),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signText(String label, bool isSelected, Color color) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 72.0,
        color: isSelected ? color : AppColors.secondaryColor.withOpacity(0.25),
      ),
    );
  }
}
