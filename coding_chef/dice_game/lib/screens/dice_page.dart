import 'package:flutter/material.dart';
import 'dart:math';

import 'package:fluttertoast/fluttertoast.dart';

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDice = Random().nextInt(5) + 1;
  int rightDice = Random().nextInt(5) + 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dice Game'),
        backgroundColor: Colors.redAccent,
      ),
      backgroundColor: Colors.redAccent[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32.0,
                vertical: 60.0,
              ),
              child: Row(
                children: [
                  Expanded(
                      child: Image.asset('assets/images/dice$leftDice.png')),
                  const SizedBox(width: 20.0),
                  Expanded(
                      child: Image.asset('assets/images/dice$rightDice.png')),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
                minimumSize: const Size(100, 60),
              ),
              onPressed: () {
                setState(() {
                  leftDice = Random().nextInt(6) + 1;
                  rightDice = Random().nextInt(6) + 1;
                });

                // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                //   content: Text('Left dice: $leftDice\nRight dice: $rightDice'),
                //   duration: const Duration(milliseconds: 500),
                // ));

                Fluttertoast.showToast(
                  msg: 'Left dice: $leftDice\nRight dice: $rightDice',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                );
              },
              child: const Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 50.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
