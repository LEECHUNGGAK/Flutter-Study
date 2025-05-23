import 'package:flutter/material.dart';
import 'package:ui_challenge/widgets/currency_card.dart';

import 'widgets/button.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF181818),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Hey, Selena",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        "Welcome back",
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.8),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 40),
              Text(
                "Total Balance",
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.8),
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "\$5 194 482",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Button(
                    text: "Transfer",
                    backgroundColor: Color(0xFFF1B33B),
                    textColor: Colors.black,
                  ),
                  Button(
                    text: "Request",
                    backgroundColor: Color(0xFF1F2123),
                    textColor: Colors.white,
                  ),
                ],
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Wallets",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "View All",
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.8),
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              CurrencyCard(
                name: "Euro",
                code: "EUR",
                amount: "6 428",
                icon: Icons.euro,
                isInverted: false,
                order: 1,
              ),
              CurrencyCard(
                name: "Bitcoin",
                code: "BTC",
                amount: "9 785",
                icon: Icons.currency_bitcoin,
                isInverted: true,
                order: 2,
              ),
              CurrencyCard(
                name: "Dollar",
                code: "USD",
                amount: "9 785",
                icon: Icons.attach_money,
                isInverted: false,
                order: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
