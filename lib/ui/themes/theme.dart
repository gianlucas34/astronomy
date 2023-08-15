import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'Work Sans',
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF653139),
    primaryContainer: Color(0xFF512b33),
    onPrimary: Color(0xFF271f26),
    onPrimaryContainer: Color(0xFF191b22),
  ),
  textTheme: const TextTheme(
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
  ),
);
