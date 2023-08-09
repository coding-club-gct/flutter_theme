library flutter_theme;

import 'package:catppuccin/catppuccin.dart';
import 'package:flutter/material.dart';

Map<FlavourColorKeys, Color> convertColorInfoMapToColorMap(
    Map<FlavourColorKeys, ColorInfo> colorInfoMap) {
  return colorInfoMap.map((key, colorInfo) => MapEntry(key,
      Color.fromRGBO(colorInfo.rgb[0], colorInfo.rgb[1], colorInfo.rgb[2], 1)));
}

Map<FlavourColorKeys, Color> mocha =
    convertColorInfoMapToColorMap(variants[FlavourNames.mocha]!);
Map<FlavourColorKeys, Color> latte =
    convertColorInfoMapToColorMap(variants[FlavourNames.latte]!);

ThemeData catppuccinTheme(
    bool isDark, Color? primaryColor, Color? secondaryColor,
    {bool useMaterial3 = true}) {
  Map<FlavourColorKeys, Color> flavour = isDark ? mocha : latte;
  primaryColor ??= flavour[FlavourColorKeys.mauve];
  secondaryColor ??= flavour[FlavourColorKeys.pink];
  return ThemeData(
      useMaterial3: useMaterial3,
      appBarTheme: AppBarTheme(
          elevation: 0,
          titleTextStyle: TextStyle(
              color: flavour[FlavourColorKeys.text],
              fontSize: 20,
              fontWeight: FontWeight.bold),
          backgroundColor: flavour[FlavourColorKeys.crust],
          foregroundColor: flavour[FlavourColorKeys.mantle]),
      colorScheme: ColorScheme(
        background: flavour[FlavourColorKeys.base]!,
        brightness: isDark ? Brightness.dark : Brightness.light,
        error: flavour[FlavourColorKeys.surface2]!,
        onBackground: flavour[FlavourColorKeys.text]!,
        onError: flavour[FlavourColorKeys.red]!,
        onPrimary: primaryColor!,
        onSecondary: secondaryColor!,
        onSurface: flavour[FlavourColorKeys.text]!,
        primary: flavour[FlavourColorKeys.crust]!,
        secondary: flavour[FlavourColorKeys.mantle]!,
        surface: flavour[FlavourColorKeys.surface0]!,
      ),
      textTheme: const TextTheme().apply(
        bodyColor: flavour[FlavourColorKeys.text],
        displayColor: primaryColor,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        elevation: 0,
      ));
}
