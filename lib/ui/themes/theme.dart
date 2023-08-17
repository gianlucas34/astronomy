import 'package:flutter/material.dart';

const ColorScheme colorScheme = ColorScheme.light(
  primary: Color(0xFF653139),
  primaryContainer: Color(0xFF512b33),
  onPrimary: Color(0xFF271f26),
  onPrimaryContainer: Color(0xFF191b22),
);

const TextTheme textTheme = TextTheme(
  titleLarge: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  ),
  bodyMedium: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: Colors.white,
  ),
  labelMedium: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  ),
  labelSmall: TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  ),
);

ThemeData theme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'Work Sans',
  colorScheme: colorScheme,
  textTheme: textTheme,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: colorScheme.primary,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white60,
    selectedLabelStyle: textTheme.labelMedium,
    unselectedLabelStyle: textTheme.labelSmall,
  ),
);
