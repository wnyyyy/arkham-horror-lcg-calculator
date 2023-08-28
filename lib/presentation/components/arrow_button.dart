import 'dart:math';
import 'package:arkham_horror_lcg_calculator/domain/enums.dart';
import 'package:arkham_horror_lcg_calculator/presentation/components/assets/app_icons.dart';
import 'package:flutter/material.dart';

class ArrowButton extends StatelessWidget {
  final ArrowDirection direction;
  final VoidCallback onPressed;
  final bool doubleArrow;

  ArrowButton({
    required this.direction,
    required this.onPressed,
    this.doubleArrow = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: onPressed,
      icon: Transform.rotate(
        angle: _getAngle(direction),
        child: doubleArrow ? AppIcons.arrowDouble : AppIcons.arrow,
      ),
    );
  }

  double _getAngle(ArrowDirection direction) {
    switch (direction) {
      case ArrowDirection.up:
        return pi * 1.5;
      case ArrowDirection.right:
        return 0.0;
      case ArrowDirection.down:
        return pi * 0.5;
      case ArrowDirection.left:
        return pi;
      default:
        return 0.0;
    }
  }
}
