import 'package:flutter/material.dart';
import 'package:weather_app/screens/loading_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        textTheme: TextTheme(
          displayLarge: GoogleFonts.lato(),
          displayMedium: GoogleFonts.lato(),
          displaySmall: GoogleFonts.lato(
            fontSize: 26.0, 
          ),
          titleMedium: GoogleFonts.lato(),
          bodyMedium: GoogleFonts.lato(),
        ),
      ),
      home: LoadingPage(),
    );
  }
}