import 'package:arkham_horror_lcg_calculator/presentation/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppUI {
  static const _colorFilter =
      ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn);

  static final divider = Container(
      width: double.infinity,
      child: Transform.scale(
        scaleY: 0.5,
        child: (SvgPicture.asset(
          'assets/ui/divider.svg',
          colorFilter: _colorFilter,
          fit: BoxFit.fill,
        )),
      ));

  static final divider_vertical = SvgPicture.asset(
    'assets/ui/divider_vertical.svg',
    colorFilter: _colorFilter,
    fit: BoxFit.fill,
  );
}
