import 'package:favoritemovies/home/page/home.dart';
import 'package:favoritemovies/resources/theme_manager.dart';
import 'package:favoritemovies/splash/page/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getApplicationTheme(),
      title: 'Splash to Home Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const Splash(),
        '/home': (context) => Home(),
      },
    );
  }
}
