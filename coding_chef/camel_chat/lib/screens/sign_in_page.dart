import 'package:camel_chat/screens/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignInPage extends StatefulWidget {
  final _formGlobalKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool signUpFlag = false;
  String userEmail = '';
  String userPassword = '';
  String userNickname = '';
  bool formValidFlag = false;
  UserCredential? newUser;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
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
                        Text(
                          signUpFlag ? 'Welcome to' : 'Welcome back to',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Camel Chat!',
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                        ),
                        // RichText(
                        //   text: TextSpan(
                        //     children: [
                        //       TextSpan(
                        //         text: signUpFlag
                        //             ? 'Welcome to '
                        //             : 'Welcome back to ',
                        //         style: Theme.of(context).textTheme.displayMedium,
                        //       ),
                        //       TextSpan(
                        //         text: 'Camel Chat!',
                        //         style: Theme.of(context).textTheme.displayLarge,
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        const SizedBox(
                          height: 32.0,
                        ),
                        Text(
                          signUpFlag
                              ? 'Sign up to continue!'
                              : 'Sign in to continue!',
                          style: Theme.of(context).textTheme.displaySmall,
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
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeIn,
                width: screenWidth * 0.8,
                height: signUpFlag ? screenHeight * 0.3 : screenHeight * 0.25,
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
                child: SingleChildScrollView(
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
                      SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Form(
                            key: widget._formGlobalKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.email),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(35.0),
                                    ),
                                    hintText: 'E-mail',
                                    contentPadding: const EdgeInsets.all(10.0),
                                  ),
                                  onSaved: (newValue) {
                                    if (newValue == null) {
                                      userEmail = '';
                                    } else {
                                      userEmail = newValue;
                                    }
                                  },
                                  validator: (value) {
                                    if (value!.contains('@')) {
                                      return null;
                                    }
                                    return 'Please enter a valid email address!';
                                  },
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                TextFormField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.lock),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(35.0),
                                    ),
                                    hintText: 'Password',
                                    contentPadding: const EdgeInsets.all(10.0),
                                  ),
                                  onSaved: (newValue) {
                                    if (newValue == null) {
                                      userPassword = '';
                                    } else {
                                      userPassword = newValue;
                                    }
                                  },
                                  validator: (value) {
                                    if (value!.length >= 6) {
                                      return null;
                                    }
                                    return 'Password must be at least 7 characters long!';
                                  },
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                if (signUpFlag)
                                  TextFormField(
                                    decoration: InputDecoration(
                                      prefixIcon:
                                          const Icon(Icons.account_circle),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(35.0),
                                      ),
                                      hintText: 'Nickname',
                                      contentPadding:
                                          const EdgeInsets.all(10.0),
                                    ),
                                    onSaved: (newValue) {
                                      if (newValue == null) {
                                        userNickname = '';
                                      } else {
                                        userNickname = newValue;
                                      }
                                    },
                                    validator: (value) {
                                      if (value!.length >= 4) {
                                        return null;
                                      }
                                      return 'Please enter at least 4 characters!';
                                    },
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeIn,
              top: signUpFlag ? screenHeight * 0.675 : screenHeight * 0.625,
              // 가운데 정렬
              left: 0.0,
              right: 0.0,
              child: GestureDetector(
                onTap: () async {
                  formValidFlag =
                      widget._formGlobalKey.currentState!.validate();

                  if (formValidFlag) {
                    widget._formGlobalKey.currentState!.save();
                  }

                  if (signUpFlag) {
                    try {
                      newUser =
                          await widget._auth.createUserWithEmailAndPassword(
                        email: userEmail,
                        password: userPassword,
                      );

                      await FirebaseFirestore.instance
                          .collection('users')
                          // 문서의 ID를 지정합니다.
                          .doc(newUser!.user!.uid)
                          // 문서의 필드와 값을 지정합니다.
                          .set({'nickname': userNickname});

                      // if (context.mounted) {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => ChatPage(),
                      //     ),
                      //   );
                      // }
                    } catch (e) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text('Please check your email and password!'),
                          ),
                        );
                      }
                    }
                  } else {
                    try {
                      newUser = await widget._auth.signInWithEmailAndPassword(
                        email: userEmail,
                        password: userPassword,
                      );

                      // if (context.mounted) {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => ChatPage(),
                      //     ),
                      //   );
                      // }
                    } catch (e) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text('Please check your email and password!'),
                          ),
                        );
                      }
                    }
                  }
                },
                child: Container(
                  width: 90.0,
                  height: 90.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        colorScheme.primaryContainer,
                        colorScheme.primary,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 3.0,
                        spreadRadius: 1.0,
                        // 위젯과 그림자의 거리
                        offset: const Offset(3.0, 3.0),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.arrow_forward),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeIn,
              top: signUpFlag ? screenHeight * 0.8 : screenHeight * 0.75,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Text(signUpFlag ? 'or sign up with' : 'or sign in with'),
                  const SizedBox(
                    height: 10.0,
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.primary,
                    ),
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      color: colorScheme.onPrimary,
                    ),
                    label: Text(
                      'Google',
                      style: TextStyle(
                        color: colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
