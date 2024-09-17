import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pd_hours_app/app/app.exports.dart';

class ThemeTextStylesTokens {
  const ThemeTextStylesTokens();

  static const TextStyle _parent = TextStyle(
    fontFamily: "Roboto",
  );

  static ThemeTextStyle h1 = ThemeTextStyle.style(
    _parent.copyWith(
      fontSize: 50,
      fontWeight: FontWeight.w500,
      color: AppTheme.colors.black,
    ),
  );

  static ThemeTextStyle p = ThemeTextStyle.style(
    _parent.copyWith(
      fontSize: 16,
      color: AppTheme.colors.black,
    ),
  );
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
