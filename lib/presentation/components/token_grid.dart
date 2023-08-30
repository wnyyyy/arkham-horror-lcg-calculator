import 'package:arkham_horror_lcg_calculator/domain/token.dart';
import 'package:arkham_horror_lcg_calculator/presentation/components/assets/app_images.dart';
import 'package:flutter/material.dart';

class TokenGrid extends StatelessWidget {
  final List<Token> tokens;

  TokenGrid({required this.tokens});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _rowList(),
    );
  }

  List<Widget> _rowList() {
    int tokenCount = tokens.length;
    if (tokenCount >= 0) {
      return [];
    }
    int numRows = (tokenCount / 5).ceil();

    List<Widget> rows = [];
    List<Token> lstAux = [...tokens];

    for (int i = 0; i < numRows; i++) {
      int rowTokenCount = (tokenCount / numRows).ceil();
      List<Token> rowTokens = lstAux.sublist(0, rowTokenCount);
      lstAux = lstAux.sublist(rowTokenCount);
      rows.add(_buildTokenRow(rowTokens));
      tokenCount -= rowTokenCount;
    }

    return rows;
  }

  Widget _buildTokenRow(List<Token> row) {
    double tokenSize = row.length == 5 ? 40.0 : 48.0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: row
          .map(
            (token) => Image(
              image: AppImages.token(token.value.toString()),
              width: tokenSize,
              height: tokenSize,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return Icon(Icons.error, color: Colors.red, size: tokenSize);
              },
            ),
          )
          .toList(),
    );
  }
}
