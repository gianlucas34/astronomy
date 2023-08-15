import 'package:astronomy/app/presentation/screens/apod_today_screen.dart';
import 'package:astronomy/providers.dart';
import 'package:astronomy/ui/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  await setupProviders();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Astronomy',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const ApodTodayScreen(),
    );
  }
}
