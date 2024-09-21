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
  }) : style = AppTheme.textStyles.h1;

  AText.h2(
    this.data, {
    super.key,
    this.variation,
    this.align,
  }) : style = AppTheme.textStyles.h2;

  AText.h3(
    this.data, {
    super.key,
    this.variation,
    this.align,
  }) : style = AppTheme.textStyles.h3;

  AText.h5(
    this.data, {
    super.key,
    this.variation,
    this.align,
  }) : style = AppTheme.textStyles.h5;

  AText.p(
    this.data, {
    super.key,
    this.variation,
    this.align,
  }) : style = AppTheme.textStyles.p;

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
