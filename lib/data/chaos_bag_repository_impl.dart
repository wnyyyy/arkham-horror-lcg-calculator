import 'dart:convert';
import 'dart:io';
import 'package:arkham_horror_lcg_calculator/domain/chaos_bag_repository.dart';
import 'package:arkham_horror_lcg_calculator/domain/token.dart';
import 'package:path_provider/path_provider.dart';

class ChaosBagRepositoryImpl implements ChaosBagRepository {
  final String _fileName = 'chaos_bag.json';

  @override
  Future<List<Token>> get() async {
    try {
      final file = await _localFile;
      final jsonString = await file.readAsString();
      final List<dynamic> jsonList = jsonDecode(jsonString);
      List<Token> tokens = [];
      for (var elem in jsonList) {
        if (elem['type'] == 'number') {
          tokens.add(NumberToken.fromJson(elem));
        } else if (elem['type'] == 'sign') {
          tokens.add(SignToken.fromJson(elem));
        }
      }
      return tokens;
    } catch (error) {
      print("Failed to load tokens from file: $error");
      return [];
    }
  }

  @override
  Future<void> save(List<Token> tokens) async {
    try {
      final file = await _localFile;
      List<dynamic> jsonList = [];
      for (Token token in tokens) {
        jsonList.add(token.toJson());
      }
      await file.writeAsString(jsonEncode(jsonList));
    } catch (error) {
      print("Failed to save tokens to file: $error");
    }
  }

  Future<File> get _localFile async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/$_fileName');
  }
}
