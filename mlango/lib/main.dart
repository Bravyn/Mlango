import 'package:flutter/material.dart';
import 'package:mlango/screens/landing_page.dart';
//import 'package:mlango/screens/main_menu.dart';

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
          //background image
          Positioned.fill(
            child: Image.asset('assets/images/bgg.jpg', fit: BoxFit.cover),
          ),

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color.fromARGB(5, 255, 255, 255),
                  Color.fromARGB(255, 0, 0, 0),
                ],
              ),
            ),
          ),

          //bottom buttons
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Text(
                    "LEAP",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(height: 5),

                Center(
                  child: Text(
                    "OF FAITH.",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900, letterSpacing: 2.0),
                  ),
                ),
                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(330, 60),
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                  child: Text(
                    "Get Started",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
                SizedBox(height: 20),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LandingPage()));
                  },
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    //primary: Colors.white,
                    minimumSize: Size(330, 60),
                    side: BorderSide(color: Colors.indigoAccent),
                  ),
                  child: Text(
                    'Already have an Invite?',
                    style: TextStyle(
                      color: Colors.indigoAccent,
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}
