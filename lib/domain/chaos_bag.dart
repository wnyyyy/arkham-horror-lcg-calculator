import 'package:arkham_horror_lcg_calculator/domain/token.dart';

class ChaosBag {
  static late List<Token> tokens;

  static List<SignToken> get signs =>
      tokens.where((token) => token is SignToken).cast<SignToken>().toList();
  static List<NumberToken> get numbers => tokens
      .where((token) => token is NumberToken)
      .cast<NumberToken>()
      .toList();
  static List<Token> get unique => tokens.toSet().toList();
}
