import 'package:arkham_horror_lcg_calculator/domain/token.dart';

class ChaosBag {
  static late List<Token> tokens;

  static List<SignToken> get signs =>
      tokens.where((token) => token is SignToken).cast<SignToken>().toList();
  static List<NumberToken> get numbers => tokens
      .where((token) => token is NumberToken)
      .cast<NumberToken>()
      .toList();
  static int get value =>
      numbers.fold(0, (total, number) => total + number.value);
  static List<Token> get unique => tokens.toSet().toList();
}
