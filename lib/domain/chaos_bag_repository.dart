import 'package:arkham_horror_lcg_calculator/domain/token.dart';

abstract class ChaosBagRepository {
  Future<void> save(List<Token> tokens);
  Future<List<Token>> get();
}
