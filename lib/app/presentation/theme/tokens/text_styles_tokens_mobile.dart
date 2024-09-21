import 'package:flutter/material.dart';
import 'package:pd_hours_app/app/app.exports.dart';

class ThemeTextStylesTokensMobile implements IThemeTextStylesTokens {
  ThemeTextStylesTokensMobile();

  static const TextStyle _parent = TextStyle(
    fontFamily: "Roboto",
  );

  @override
  final ThemeTextStyle h1 = ThemeTextStyle.style(
    _parent.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.w500,
      color: AppTheme.colors.black,
    ),
  );

  @override
  final ThemeTextStyle h2 = ThemeTextStyle.style(
    _parent.copyWith(
      fontSize: 22,
      color: AppTheme.colors.black,
    ),
  );

  @override
  final ThemeTextStyle h3 = ThemeTextStyle.style(
    _parent.copyWith(
      fontSize: 18,
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
      fontSize: 14,
      color: AppTheme.colors.black,
    ),
  );
}
