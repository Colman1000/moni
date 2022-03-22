import 'package:flutter/material.dart';
import 'package:moni/config/colors.dart';

class MoniTheme {
  const MoniTheme._(); // this basically makes it so you can't instantiate this class

  static String get _fontFamily => 'DM';

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
    tabBarTheme: const TabBarTheme(
      labelColor: MoniColors.primaryBase,
      unselectedLabelColor: MoniColors.dark,
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: MoniColors.primaryBase,
            width: 2,
          ),
        ),
      ),
    ),
    useMaterial3: true,
  );

  static final _dark = ThemeData(
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
    tabBarTheme: const TabBarTheme(
      labelColor: MoniColors.primaryBase,
      unselectedLabelColor: MoniColors.dark,
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: MoniColors.primaryBase,
            width: 2,
          ),
        ),
      ),
    ),
    useMaterial3: true,
  );
  static ThemeData get dark => _light;

  static ThemeData get light => _dark;
}
