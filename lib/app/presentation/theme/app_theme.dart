import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pd_hours_app/app/app.exports.dart';

import 'theme.exports.dart';

class AppTheme {
  static IThemeColorsTokens colors = ColorsLight();

  static IThemeTextStylesTokens get textStyles {
    return AppController.instance.runningInMobile ? ThemeTextStylesTokensMobile() : ThemeTextStylesTokensDesktop();
  }
}

abstract class IThemeTextStylesTokens {
  ThemeTextStyle get h1;
  ThemeTextStyle get h2;
  ThemeTextStyle get h3;
  ThemeTextStyle get h5;
  ThemeTextStyle get p;
}

class ThemeTextStyle extends TextStyle {
  ThemeTextStyle.style(TextStyle style)
      : super(
          inherit: style.inherit,
          color: style.color,
          backgroundColor: style.backgroundColor,
          fontSize: style.fontSize,
          fontWeight: style.fontWeight,
          fontStyle: style.fontStyle,
          letterSpacing: style.letterSpacing,
          wordSpacing: style.wordSpacing,
          textBaseline: style.textBaseline,
          height: style.height,
          leadingDistribution: style.leadingDistribution,
          locale: style.locale,
          foreground: style.foreground,
          background: style.background,
          shadows: style.shadows,
          fontFeatures: style.fontFeatures,
          decoration: style.decoration,
          decorationColor: style.decorationColor,
          decorationStyle: style.decorationStyle,
          decorationThickness: style.decorationThickness,
          debugLabel: style.debugLabel,
          fontFamily: style.fontFamily,
          fontFamilyFallback: style.fontFamilyFallback,
          // package: style.package,
          overflow: style.overflow,
        );

  @override
  double get fontSize {
    double sizeAdjustedToScreen = super.fontSize!.sp;
    return sizeAdjustedToScreen;
  }
}
