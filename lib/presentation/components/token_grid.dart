import 'package:arkham_horror_lcg_calculator/domain/token.dart';
import 'package:arkham_horror_lcg_calculator/presentation/components/assets/app_images.dart';
import 'package:flutter/material.dart';

class TokenGrid extends StatelessWidget {
  final List<Token> tokens;

  TokenGrid({required this.tokens});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double tokenSize = constraints.maxWidth * 0.175;
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _rowList(tokenSize),
        );
      },
    );
  }

  List<Widget> _rowList(double tokenSize) {
    int tokenCount = tokens.length;
    if (tokenCount <= 0) {
      return [];
    }
    List<Widget> numberRows = _buildRowGroup(
        tokens.where((token) => token is NumberToken).toList(), tokenSize);
    List<String> specialNames = ['elderSign', 'autoFail'];
    List<Widget> signRows = _buildRowGroup(
        tokens
            .where((token) =>
                token is SignToken && !specialNames.contains(token.name))
            .toList(),
        tokenSize);
    List<Widget> specialRow = _buildRowGroup(
        tokens.where((token) => specialNames.contains(token.name)).toList(),
        tokenSize);

    return [...numberRows, ...signRows, ...specialRow];
  }

  List<Widget> _buildRowGroup(List<Token> tokens, double tokenSize) {
    if (tokens.length <= 0) {
      return [];
    }
    List<Widget> rows = [];
    int tokenCount = tokens.length;
    int numRows = (tokenCount / 4).ceil();

    while (numRows > 0) {
      int rowTokenCount = (tokenCount / numRows).ceil();
      tokenCount -= rowTokenCount;
      numRows--;
      rows.add(_buildTokenRow(tokens.sublist(0, rowTokenCount), tokenSize));
      tokens = tokens.sublist(rowTokenCount);
    }

    return rows;
  }

  Widget _buildTokenRow(List<Token> row, double tokenSize) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: row
          .map(
            (token) => Image(
              image: AppImages.token(token.name),
              width: tokenSize,
              height: tokenSize,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return Container();
              },
            ),
          )
          .toList(),
    );
  }
}
