import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  final Color color1 = const Color.fromARGB(255, 213, 227, 238);
  final int current = 17;
  final int total = 30;

 
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
                                child: Text("Option 3"),
                              ),
                            ],
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 20, 20, 20),
                            side: BorderSide(style: BorderStyle.none),
                            padding: EdgeInsets.all(7.0),
                            
                          ),
                          onPressed: null,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(Icons.local_grocery_store),
                              SizedBox(width: 10),
                              RichText(
                                text: TextSpan(
                                  text: "ABC Place", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                                  children: [TextSpan(text: "\n2.6KM AWAY", style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.black))],
                                ),
                              ),
                              SizedBox(width: 10),
                              Icon(Icons.arrow_drop_down_circle),
                            ],
                          ),
                          
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
                          fontSize: 22.0,
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

          Positioned(
            top: 340,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                
                children: [
                  Icon(Icons.coffee),
                  Text("Orders 08/30")],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
