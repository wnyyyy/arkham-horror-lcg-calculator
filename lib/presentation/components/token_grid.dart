import 'package:arkham_horror_lcg_calculator/domain/token.dart';
import 'package:arkham_horror_lcg_calculator/presentation/components/assets/app_images.dart';
import 'package:arkham_horror_lcg_calculator/presentation/themes/app_colors.dart';
import 'package:flutter/material.dart';

class TokenGrid extends StatelessWidget {
  final List<Token> tokens;
  final Function(Token) onTapToken;
  final Set<Token> winningTokens;

  TokenGrid(
      {required this.tokens,
      required this.onTapToken,
      this.winningTokens = const {}});

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
    List<Widget> signRows = _buildRowGroup(
        tokens.where((token) => token is SignToken && !token.special).toList(),
        tokenSize);
    List<Widget> specialRow = _buildRowGroup(
        tokens.where((token) => token is SignToken && token.special).toList(),
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
            (token) => _buildToken(token, tokenSize,
                isWinningToken: winningTokens.contains(token)),
          )
          .toList(),
    );
  }

  Widget _buildToken(Token token, double tokenSize,
      {bool isWinningToken = false}) {
    return GestureDetector(
      onTap: () => onTapToken(token),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: isWinningToken
                ? [
                    BoxShadow(
                      color: AppColors.secondaryColor,
                      spreadRadius: 4,
                      blurRadius: 8,
                    ),
                  ]
                : []),
        child: Image(
          image: AppImages.token(token.name),
          width: tokenSize,
          height: tokenSize,
          errorBuilder:
              (BuildContext context, Object exception, StackTrace? stackTrace) {
            return Container();
          },
        ),
      ),
    );
  }
}
