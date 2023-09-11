import 'package:astronomy/routes/bottom_navigation/bottom_navigation.dart';
import 'package:flutter/material.dart';

class Template extends StatelessWidget {
  final Widget child;

  const Template({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colors.primary,
            colors.onPrimary,
            colors.onPrimaryContainer,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: child,
          ),
        ),
        bottomNavigationBar: const BottomNavigation(),
      ),
    );
  }
}
