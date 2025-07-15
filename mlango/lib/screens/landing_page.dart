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
              padding: EdgeInsets.only(
                top: 40.0,
                left: 12.0,
                right: 12.0,
                bottom: 0,
              ),
              color: color1,
              child: Column(
                children: [
                  // SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PopupMenuButton<String>(
                        onSelected: (value) {
                          //
                        },
                        itemBuilder:
                            (BuildContext context) => [
                              PopupMenuItem(
                                value: 'Option 1',
                                child: Text("Option 1"),
                              ),
                              PopupMenuItem(
                                value: 'Option 2',
                                child: Text('Option 2'),
                              ),
                              PopupMenuItem(
                                value: 'Option 3',
                                child: Text("Option 3")
                            )
                            ],
                            child: ElevatedButton(onPressed: null, 
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(Icons.local_grocery_store),
                                SizedBox(width: 10),
                                RichText(text: TextSpan(text: "ABC Place", children: [
                                  TextSpan(text: "\n2.6KM AWAY")
                                ])),
                                SizedBox(width: 10,),
                                Icon(Icons.arrow_circle_down_outlined)

                              ]
                              
                            )
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
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Image.asset(
                      'assets/images/LIQUID BIOMETRICS.jpg',
                      height: 200,
                      fit: BoxFit.cover,
                    ),
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
