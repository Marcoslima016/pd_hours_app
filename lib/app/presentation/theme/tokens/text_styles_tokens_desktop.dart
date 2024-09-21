import 'package:flutter/material.dart';
import 'package:pd_hours_app/app/app.exports.dart';

class ThemeTextStylesTokensDesktop implements IThemeTextStylesTokens {
  ThemeTextStylesTokensDesktop();

  static const TextStyle _parent = TextStyle(
    fontFamily: "Roboto",
  );

  @override
  final ThemeTextStyle h1 = ThemeTextStyle.style(
    _parent.copyWith(
      fontSize: 50,
      fontWeight: FontWeight.w500,
      color: AppTheme.colors.black,
    ),
  );

  @override
  final ThemeTextStyle h2 = ThemeTextStyle.style(
    _parent.copyWith(
      fontSize: 38,
      color: AppTheme.colors.black,
    ),
  );

  @override
  final ThemeTextStyle h3 = ThemeTextStyle.style(
    _parent.copyWith(
      fontSize: 28,
      color: AppTheme.colors.black,
    ),
  );

  @override
  final ThemeTextStyle h5 = ThemeTextStyle.style(
    _parent.copyWith(
      fontSize: 12,
      color: AppTheme.colors.black,
    ),
  );

  @override
  final ThemeTextStyle p = ThemeTextStyle.style(
    _parent.copyWith(
      fontSize: 16,
      color: AppTheme.colors.black,
    ),
  );
}
