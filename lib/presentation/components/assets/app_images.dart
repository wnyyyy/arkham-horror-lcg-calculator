import 'package:flutter/material.dart';

class AppImages {
  static final tokenBackground =
      AssetImage('assets/images/token_background.png');

  static AssetImage token(String tokenName) {
    return AssetImage('assets/images/chaos_token/$tokenName.png');
  }
}
