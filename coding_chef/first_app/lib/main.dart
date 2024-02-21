import 'package:flutter/material.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "BBANTO",
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[800],
      appBar: AppBar(
        title: const Text("BBANTO"),
        centerTitle: true,
        backgroundColor: Colors.amber[700],
        elevation: 0.0,
        // leading: IconButton(
        //   onPressed: () {
        //     print("Menu button is pressed!");
        //   },
        //   icon: const Icon(Icons.menu),
        // ),
        actions: [
          IconButton(
            onPressed: () {
              print("Shopping cart button is pressed!");
            },
            icon: const Icon(Icons.shopping_cart),
          ),
          IconButton(
            onPressed: () {
              print("Search button is pressed!");
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text("BBANTO"),
              accountEmail: const Text("bbanto@bbanto.com"),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage("assets/pikachu.png"),
                backgroundColor: Colors.white,
              ),
              otherAccountsPictures: const [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/charmander.png"),
                  backgroundColor: Colors.white,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage("assets/squirtle.png"),
                  backgroundColor: Colors.white,
                ),
              ],
              onDetailsPressed: () {
                print("Details is pressed!");
              },
              decoration: BoxDecoration(
                  color: Colors.red[200],
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0),
                  )),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey[850],
              ),
              title: const Text("Home"),
              trailing: const Icon(Icons.add),
              onTap: () {
                print("Home is pressed!");
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.grey[850],
              ),
              title: const Text("Setting"),
              trailing: const Icon(Icons.add),
              onTap: () {
                print("Setting is pressed!");
              },
            ),
            ListTile(
              leading: Icon(
                Icons.question_answer,
                color: Colors.grey[850],
              ),
              title: const Text("Q&A"),
              trailing: const Icon(Icons.add),
              onTap: () {
                print("Q&A is pressed!");
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 40.0, 0.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/pikachu.gif"),
                radius: 60.0,
              ),
            ),
            Divider(
              height: 60.0,
              color: Colors.grey[850],
              thickness: 0.5,
              endIndent: 30.0,
            ),
            const Text(
              "NAME",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              "BBANTO",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Text(
              "BBANTO POWER LEVEL",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              "14",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Row(
              children: [
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "Using lightsaber",
                  style: TextStyle(
                    fontSize: 16.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "Face hero tatto",
                  style: TextStyle(
                    fontSize: 16.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "Fire flames",
                  style: TextStyle(
                    fontSize: 16.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
            const Center(
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/pikachu.png"),
                backgroundColor: Colors.transparent,
                radius: 40.0,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Hello",
                        textAlign: TextAlign.center,
                      ),
                      backgroundColor: Colors.teal,
                      duration: Duration(milliseconds: 1000),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: const Text(
                  "Show me",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
