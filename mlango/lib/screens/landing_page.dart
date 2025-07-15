import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  final color1 = const Color.fromARGB(255, 213, 227, 238);
  @override
  Widget build(BuildContext content) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(top: 40.0, left: 12.0, right: 12.0, bottom: 0),
              color: color1,
              child: Column(
                children: [
                  // SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton.icon(
                        icon: Icon(Icons.account_tree_rounded, size: 26, color: const Color.fromARGB(255, 231, 81, 81)),
                        onPressed: () {},
                        label: RichText(
                          text: TextSpan(
                            text: "ABC PLACE",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text: "\n2.6KM AWAY",
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 142, 219, 255),
                          side: BorderSide(
                            color: Color.fromARGB(255, 142, 219, 255),
                          ),
                          elevation: 0.0,
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.amber,
                        foregroundImage: AssetImage('assets/images/pf.jpg'),
                        radius: 27,
                      ),
                    ],
                  ),
                  SizedBox(height: 13),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Good Evening, Monica!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  SizedBox(height: 7),
                  ClipRRect(borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)), 
                  child: Image.asset('assets/images/LIQUID BIOMETRICS.jpg',height: 200, fit: BoxFit.cover),
),
                  SizedBox(height: 11),
                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
