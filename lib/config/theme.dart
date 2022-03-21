import 'package:flutter/material.dart';
import 'package:moni/config/colors.dart';

class MoniTheme {
  const MoniTheme._(); // this basically makes it so you can't instantiate this class

  static String get _fontFamily => '';

  static final _light = ThemeData(
    fontFamily: _fontFamily,
  ).copyWith(
    primaryColor: MoniColors.primaryLight,
    backgroundColor: MoniColors.backgroundLight,
    scaffoldBackgroundColor: MoniColors.backgroundLight,
    colorScheme: const ColorScheme.light(
      background: MoniColors.backgroundLight,
      brightness: Brightness.light,
      primary: MoniColors.primaryLight,
      secondary: MoniColors.secondaryBase,
      surface: MoniColors.backgroundLight,
    ),
    useMaterial3: true,
  );

  static final _dark = ThemeData(
    fontFamily: _fontFamily,
  ).copyWith(
    primaryColor: MoniColors.primaryDark,
    backgroundColor: MoniColors.backgroundDark,
    scaffoldBackgroundColor: MoniColors.backgroundDark,
    colorScheme: const ColorScheme.dark(
      background: MoniColors.backgroundDark,
      brightness: Brightness.dark,
      primary: MoniColors.primaryDark,
      secondary: MoniColors.secondaryBase,
      surface: MoniColors.backgroundDark,
    ),
    useMaterial3: true,
  );

  static ThemeData get dark => _dark;

  static ThemeData get light => _light;
}
