import 'dart:math';

import 'package:arkham_horror_lcg_calculator/presentation/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcons {
  static const _colorFilter =
      ColorFilter.mode(AppColors.secondaryColor, BlendMode.srcIn);

  static final plus =
      SvgPicture.asset('assets/icons/plus.svg', colorFilter: _colorFilter);
  static final plusCrossed = SvgPicture.asset('assets/icons/plus_crossed.svg',
      colorFilter: _colorFilter);
  static final sign =
      SvgPicture.asset('assets/icons/sign.svg', colorFilter: _colorFilter);
  static final signCrossed = SvgPicture.asset('assets/icons/sign_crossed.svg',
      colorFilter: _colorFilter);
  static final chaosBag =
      SvgPicture.asset('assets/icons/chaos_bag.svg', colorFilter: _colorFilter);
  static final arrow =
      SvgPicture.asset('assets/icons/arrow.svg', colorFilter: _colorFilter);
  static final arrowDouble = SvgPicture.asset('assets/icons/arrow_double.svg',
      colorFilter: _colorFilter);
  static final x = Transform.rotate(
      angle: pi * 0.25,
      child:
          SvgPicture.asset('assets/icons/plus.svg', colorFilter: _colorFilter));
}
