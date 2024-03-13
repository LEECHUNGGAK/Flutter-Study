import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool signUpFlag = false;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: ColoredBox(
                color: colorScheme.surface,
              ),
            ),
          ),
          Positioned(
            child: SizedBox(
              width: double.infinity,
              height: screenHeight * 0.5,
              child: ColoredBox(
                color: colorScheme.primaryContainer,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.1,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Welcome to ',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            TextSpan(
                              text: 'Camel Chat!',
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        'Sign up to continue!',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.4,
            left: screenWidth * 0.1,
            child: Container(
              width: screenWidth * 0.8,
              height: screenHeight * 0.3,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    // 그림자 가장자리를 번지게 하는 정도
                    // 값이 높을수록 가장자리의 범위가 넓어지며 흐릿해집니다.
                    blurRadius: 15.0,
                    // 그림자의 범위
                    spreadRadius: 5.0,
                  )
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            signUpFlag = false;
                          });
                        },
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(bottom: 3.0),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: signUpFlag
                                        ? Colors.transparent
                                        : colorScheme.onPrimaryContainer,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  fontWeight: signUpFlag
                                      ? FontWeight.w300
                                      : FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            signUpFlag = true;
                          });
                        },
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(bottom: 3.0),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: signUpFlag
                                        ? colorScheme.onPrimaryContainer
                                        : Colors.transparent,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontWeight: signUpFlag
                                      ? FontWeight.bold
                                      : FontWeight.w300,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Form(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextFormField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.account_circle),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(35.0),
                                  ),
                                  hintText: 'ID',
                                  contentPadding: EdgeInsets.all(10.0),
                                ),
                              ),
                              // const SizedBox(height: 8.0,),
                              TextFormField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.account_circle),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(35.0),
                                  ),
                                  hintText: 'ID',
                                  contentPadding: EdgeInsets.all(10.0),
                                ),
                              ),
                              // const SizedBox(height: 8.0,),
                              TextFormField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.account_circle),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(35.0),
                                  ),
                                  hintText: 'ID',
                                  contentPadding: EdgeInsets.all(10.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.675,
            // 가운데 정렬
            left: 0.0,
            right: 0.0,
            child: Container(
              width: 90.0,
              height: 90.0,
              decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
            ),
          ),
        ],
      ),
    );
  }
}
