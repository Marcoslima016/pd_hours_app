import 'package:flutter/material.dart';

abstract class IThemeColorsTokens {
  Color get primary;
  Color get onPrimary;
  Color get secondary;
  Color get tertiary;
  Color get onSecondary;
  Color get disable;
  Color get onDisable;
  Color get surface;
  Color get onSurface;
  Color get background;
  Color get onBackground;
  Color get black;
  Color get grey3;
}

class ColorsLight implements IThemeColorsTokens {
  ColorsLight();

  @override
  final Color primary = const Color(0xff4263EB);

  @override
  final Color onPrimary = const Color(0xff212429);

  @override
  final Color secondary = const Color(0xff7048E8);

  @override
  Color get onSecondary => const Color(0xff212429);

  @override
  final Color tertiary = const Color(0xff51CF66);

  @override
  final Color surface = const Color.fromARGB(255, 255, 255, 255);

  @override
  Color get onSurface => const Color.fromARGB(255, 57, 57, 57);

  @override
  final Color background = const Color.fromARGB(255, 249, 250, 252);
  // final Color background = Colors.grey;

  @override
  final Color onBackground = const Color.fromARGB(255, 250, 250, 250);

  @override
  Color get disable => const Color.fromARGB(255, 229, 228, 228);

  @override
  Color get onDisable => const Color.fromARGB(255, 166, 165, 165);

  @override
  Color get black => const Color(0xff212429);

  @override
  Color get grey3 => const Color(0xffACB5BD);
}
