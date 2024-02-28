import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LogInPage(),
    );
  }
}

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50.0,
            ),
            Center(
              child: Image.asset(
                'assets/images/roll_a_dice.gif',
                width: 170.0,
                height: 190.0,
              ),
            ),
            Form(
              child: Theme(
                data: ThemeData(
                  primaryColor: Colors.teal,
                  inputDecorationTheme: const InputDecorationTheme(
                    labelStyle: TextStyle(
                      color: Colors.teal,
                      fontSize: 15.0,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    children: [
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Enter ID',
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Enter Password',
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                      ),
                      const SizedBox(height: 40.0,),
                      ButtonTheme(
                        minWidth: 100,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 35.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
