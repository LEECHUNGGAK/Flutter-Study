import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  List<int> numbers = [];
  bool showTitle = true;

  void onClicked() {
    setState(() {
      numbers.add(numbers.length);
    });
  }

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(titleLarge: TextStyle(color: Colors.red)),
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle ? MyTitle() : Text("Nothing"),
              for (var elem in numbers) Text("$elem"),
              IconButton(
                iconSize: 40,
                onPressed: onClicked,
                icon: Icon(Icons.add_box),
              ),
              IconButton(
                iconSize: 40,
                onPressed: toggleTitle,
                icon: Icon(Icons.remove_red_eye),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyTitle extends StatefulWidget {
  const MyTitle({
    super.key,
  });

  @override
  State<MyTitle> createState() => _MyTitleState();
}

class _MyTitleState extends State<MyTitle> {
  @override
  void initState() {
    super.initState();
    print("MyTitle initState");
  }

  @override
  void dispose() {
    super.dispose();
    print("MyTitle dispose");
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "Click Count",
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge!.color,
      ),
    );
  }
}
