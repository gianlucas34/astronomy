import 'package:astronomy/app_widget.dart';
import 'package:astronomy/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  await setupProviders();

  runApp(const AppWidget());
}
