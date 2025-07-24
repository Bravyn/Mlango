import 'package:flutter/material.dart';
import 'package:mlango/screens/sign_up.dart';
//import 'package:mlango/screens/main_menu.dart';

void main() {
  
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SignUp());
  }
}


