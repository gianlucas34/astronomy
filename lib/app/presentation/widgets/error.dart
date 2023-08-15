import 'package:flutter/material.dart';

class Error extends StatelessWidget {
  final String message;

  const Error({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.error_outline,
          color: Colors.white,
          size: 40.0,
        ),
        Center(
          child: Text(
            message,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        )
      ],
    );
  }
}
