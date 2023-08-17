import 'package:flutter/material.dart';

class Last10Screen extends StatefulWidget {
  const Last10Screen({super.key});

  @override
  State<Last10Screen> createState() => _Last10ScreenState();
}

class _Last10ScreenState extends State<Last10Screen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fonts = theme.textTheme;

    return Text(
      "Last 10 screen",
      style: fonts.titleLarge,
    );
  }
}
