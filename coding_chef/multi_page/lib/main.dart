import 'package:flutter/material.dart';

import 'package:multi_page/screens/page_a.dart';
import 'package:multi_page/screens/page_b.dart';
import 'package:multi_page/screens/page_c.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const PageA(),
        '/b':(context) => const PageB(),
        '/c':(context) => const PageC(),
      },
    );
  }
}
