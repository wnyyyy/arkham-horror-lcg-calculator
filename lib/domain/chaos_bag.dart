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
  static Set<Token> get allowedTokens => <Token>{
        NumberToken(1),
        NumberToken(0),
        NumberToken(-1),
        NumberToken(-2),
        NumberToken(-3),
        NumberToken(-4),
        SignToken(SignType.skull),
        SignToken(SignType.cultist),
        SignToken(SignType.tablet),
        SignToken(SignType.elderThing),
        SignToken(SignType.autoFail),
        SignToken(SignType.elderSign),
      };
}
