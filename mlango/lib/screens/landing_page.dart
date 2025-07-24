import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  final Color color1 = const Color.fromARGB(255, 213, 227, 238);
  final int current = 8;
  final int total = 30;

  @override
  Widget build(BuildContext context) {
    double progress = current / total;
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
                                child: Text("Order Now"),
                              ),
                              PopupMenuItem(
                                value: 'Option 2',
                                child: Text('Order Later'),
                              ),
                              PopupMenuItem(
                                value: 'Option 3',
                                child: Text("Profile"),
                              ),
                            ],
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: color1,
                            side: BorderSide(style: BorderStyle.none),
                            elevation: 0,
                            padding: EdgeInsets.all(7.0),
                            minimumSize: Size(200, 50),
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
                                  text: "ABC Place",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "\n2.6KM AWAY",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
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
            top: MediaQuery.of(context).size.height * 0.40,
            left: 0,
            right: 0,
            child: Container(
              color: const Color.fromARGB(255, 255, 230, 230),
              padding: EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ), // Add some padding
              child: Positioned(
                left: 12,
                right: 12,
                child: Container(
                  //padding: EdgeInsets.only(left: 18.0, right: 18.0),
                  color: Colors.white,
                  child: Row(
                    //mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,

                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 40, child: Icon(Icons.coffee, size: 30)),

                      SizedBox(width: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 120,
                        child: Column(
                          children: [
                            SizedBox(height: 4),
                            LinearProgressIndicator(
                              value: progress,
                              minHeight: 8,
                              borderRadius: BorderRadius.circular(5.0),
                              color: Colors.green,
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Orders $current / $total",
                              textAlign: TextAlign.right,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
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
    );
  }
}
