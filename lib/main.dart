import 'package:flutter/material.dart';
import 'package:flutter_project_1/screens/splash.dart';

  const SAVE_KEY_NAME ="UserLoggedIn";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login page',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      home: const ScreenSplash(),
    );
  }
}
