import 'package:flutter/material.dart';

class AppImages {
  static final tokenBackground =
      AssetImage('assets/images/token_background.png');
  static final token = _TokenAssets();
}

class _TokenAssets {
  AssetImage get plus1 => _getTokenAsset('+1');
  AssetImage get zero => _getTokenAsset('0');
  AssetImage get minus1 => _getTokenAsset('-1');
  AssetImage get minus2 => _getTokenAsset('-2');
  AssetImage get minus3 => _getTokenAsset('-3');
  AssetImage get minus4 => _getTokenAsset('-4');
  AssetImage get autoFail => _getTokenAsset('auto_fail');
  AssetImage get cultist => _getTokenAsset('cultist');
  AssetImage get elderSign => _getTokenAsset('elder_sign');
  AssetImage get elderThing => _getTokenAsset('elder_thing');
  AssetImage get skull => _getTokenAsset('skull');
  AssetImage get tablet => _getTokenAsset('tablet');

  AssetImage _getTokenAsset(String tokenName) {
    return AssetImage('assets/images/chaos_token/$tokenName.png');
  }
}
