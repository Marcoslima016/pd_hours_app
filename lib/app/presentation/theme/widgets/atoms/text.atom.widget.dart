import 'package:flutter/material.dart';
import 'package:pd_hours_app/lib.exports.dart';

class AText extends StatelessWidget {
  final ThemeTextStyle? style;
  final String data;
  final TextAlign? align;
  final TextStyle? variation;

  AText.h1(
    this.data, {
    super.key,
    this.variation,
    this.align,
  }) : style = ThemeTextStylesTokens.h1;

  AText.p(
    this.data, {
    super.key,
    this.variation,
    this.align,
  }) : style = ThemeTextStylesTokens.p;

  @override
  Widget build(BuildContext context) {
    TextStyle finalStyle = style!;

    finalStyle = style!.copyWith(
      color: variation?.color,
      height: variation?.height,
    );

    return Text(
      data,
      style: finalStyle,
      textAlign: align,
    );
  }
}
