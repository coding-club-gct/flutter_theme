library flutter_theme;

import 'package:catppuccin/catppuccin.dart';
import 'package:flutter/material.dart';

Map<FlavorColorKeys, Color> convertColorInfoMapToColorMap(
    Map<FlavorColorKeys, ColorInfo> colorInfoMap) {
  return colorInfoMap.map((key, colorInfo) => MapEntry(key,
      Color.fromRGBO(colorInfo.rgb[0], colorInfo.rgb[1], colorInfo.rgb[2], 1)));
}

Map<FlavorColorKeys, Color> mocha =
    convertColorInfoMapToColorMap(variants[FlavorNames.mocha]!);
Map<FlavorColorKeys, Color> latte =
    convertColorInfoMapToColorMap(variants[FlavorNames.latte]!);

ThemeData catppuccinTheme(
    bool isDark, Color? primaryColor, Color? secondaryColor,
    {bool useMaterial3 = true}) {
  Map<FlavorColorKeys, Color> flavour = isDark ? mocha : latte;
  primaryColor ??= flavour[FlavorColorKeys.mauve];
  secondaryColor ??= flavour[FlavorColorKeys.pink];
  return ThemeData(
      useMaterial3: useMaterial3,
      appBarTheme: AppBarTheme(
          elevation: 0,
          titleTextStyle: TextStyle(
              color: flavour[FlavorColorKeys.text],
              fontSize: 20,
              fontWeight: FontWeight.bold),
          backgroundColor: flavour[FlavorColorKeys.crust],
          foregroundColor: flavour[FlavorColorKeys.mantle]),
      colorScheme: ColorScheme(
        background: flavour[FlavorColorKeys.base]!,
        brightness: isDark ? Brightness.dark : Brightness.light,
        error: flavour[FlavorColorKeys.surface2]!,
        onBackground: flavour[FlavorColorKeys.text]!,
        onError: flavour[FlavorColorKeys.red]!,
        onPrimary: primaryColor!,
        onSecondary: secondaryColor!,
        onSurface: flavour[FlavorColorKeys.text]!,
        primary: flavour[FlavorColorKeys.crust]!,
        secondary: flavour[FlavorColorKeys.mantle]!,
        surface: flavour[FlavorColorKeys.surface0]!,
      ),
      textTheme: const TextTheme().apply(
        bodyColor: flavour[FlavorColorKeys.text],
        displayColor: primaryColor,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        elevation: 0,
      ));
}
