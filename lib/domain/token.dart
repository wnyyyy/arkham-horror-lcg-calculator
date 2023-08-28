import 'package:arkham_horror_lcg_calculator/domain/token_type.dart';

class Token {
  final TokenType type;
  final dynamic value;

  Token.number(int this.value) : type = TokenType.number;
  Token.sign(String this.value) : type = TokenType.sign;
}