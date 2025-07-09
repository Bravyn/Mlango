import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SignUp());
  }
}

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.cover,
            ),
          ),

          //foreground
          Center(
            child: Text(
              'Hey there',
              style: TextStyle(
                color: const Color.fromARGB(255, 17, 0, 0),
                fontSize: 24
              ),
            ),
          )
        ],
      ),
    );
  }
}
