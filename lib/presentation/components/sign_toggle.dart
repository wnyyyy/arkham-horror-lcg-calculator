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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildToggle('+', isPositive, Colors.lightGreen),
        SizedBox(),
        _buildToggle('-', !isPositive, Colors.red),
      ],
    );
  }

  Widget _buildToggle(String label, bool isSelected, Color color) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        //splashColor: Colors.transparent,
        //highlightColor: Colors.transparent,
        onTap: () => onChanged(label == '+'),
        child: Opacity(
          opacity: isSelected ? 1.0 : 0.25,
          child: Container(
            height: 56,
            width: 56,
            alignment: Alignment.topCenter,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 48.0,
                color: isSelected ? color : AppColors.secondaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
