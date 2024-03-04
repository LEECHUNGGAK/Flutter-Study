import 'package:flutter/material.dart';

import 'package:dice_game/screens/dice_page.dart';
import 'package:dice_game/components/social_login_button.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  TextEditingController controllerID = TextEditingController();
  TextEditingController controllerPW = TextEditingController();

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
        backgroundColor: Colors.redAccent,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
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
                    child: buildLogIn(context),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: buildSocialLogIn(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column buildLogIn(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(
            labelText: 'Enter ID',
          ),
          keyboardType: TextInputType.emailAddress,
          controller: controllerID,
        ),
        TextField(
          decoration: const InputDecoration(
            labelText: 'Enter Password',
          ),
          keyboardType: TextInputType.text,
          obscureText: true,
          controller: controllerPW,
        ),
        const SizedBox(
          height: 40.0,
        ),
        ButtonTheme(
          minWidth: 100,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              if (controllerID.text == 'dice' && controllerPW.text == '1234') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DicePage()),
                );
              } else if (controllerID.text == 'dice') {
                showSnackBar(
                  context,
                  '아이디가 일치하지 않습니다.',
                );
              } else if (controllerPW.text == '1234') {
                showSnackBar(
                  context,
                  '비밀번호가 일치하지 않습니다.',
                );
              } else {
                showSnackBar(context);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
            ),
            child: const Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 35.0,
            ),
          ),
        ),
      ],
    );
  }
}

Column buildSocialLogIn() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      SocialLogInButton(
        imagePath: 'assets/images/glogo.png',
        text: 'Login with Google',
        textColor: Colors.black,
        color: Colors.white,
        borderRadius: 4.0,
        onPressed: () {},
      ),
      SocialLogInButton(
        imagePath: 'assets/images/flogo.png',
        text: 'Login with Facebook',
        textColor: Colors.white,
        color: Colors.blue,
        borderRadius: 4.0,
        onPressed: () {},
      ),
      ElevatedButton.icon(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ),
        label: const Text('Login with Facebook'),
        icon: const Icon(Icons.email),
      ),
    ],
  );
}

void showSnackBar(BuildContext context, [String message = '로그인 정보를 확인하세요.']) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      textAlign: TextAlign.center,
    ),
    duration: const Duration(seconds: 2),
    backgroundColor: Colors.blue,
  ));
}
