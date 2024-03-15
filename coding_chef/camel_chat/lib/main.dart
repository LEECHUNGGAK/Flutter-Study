import 'package:camel_chat/screens/chat_page.dart';
import 'package:camel_chat/screens/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
      // home: SignInPage(),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ChatPage();
          }
          return SignInPage();
        },
      ),
    );
  }
}
