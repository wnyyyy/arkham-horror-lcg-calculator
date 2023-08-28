import 'package:arkham_horror_lcg_calculator/presentation/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppUI {
  static const _colorFilter =
      ColorFilter.mode(AppColors.secondaryColor, BlendMode.srcIn);

  static final divider =
      SvgPicture.asset('assets/ui/divider.svg', colorFilter: _colorFilter);
}
