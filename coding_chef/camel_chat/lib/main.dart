import 'package:camel_chat/screens/sign_in_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 32.0),
          displayMedium: TextStyle(fontSize: 28.0),
          displaySmall: TextStyle(fontSize: 20.0),
        ),
      ),
      home: const SignInPage(),
    );
  }
}
