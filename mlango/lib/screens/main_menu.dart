import 'package:flutter/material.dart';
import 'package:mlango/screens/home_screen.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/bg2.jpg', fit: BoxFit.cover),
          ),
          Positioned(
            top: 40,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.white),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "AT WORK",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          color: Color.fromARGB(255, 54, 3, 3),
                        ),
                      ),
                      SizedBox(width: 12),
                      Icon(
                        Icons.computer,
                        color: const Color.fromARGB(255, 62, 5, 5),
                        size: 23,
                      ),
                    ],
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder:
                          (_) => Dialog(
                            backgroundColor: Colors.transparent,
                            insetPadding: EdgeInsets.all(10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: InteractiveViewer(
                                child: Image.asset('assets/images/pf.jpg'),
                              ),
                            ),
                          ),
                    );
                  },
                  child: CircleAvatar(
                  radius: 26,
                  backgroundImage: AssetImage("assets/images/pf.jpg"),
                ),
                  
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton.filled(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  icon: Icon(Icons.home_filled),
                  iconSize: 33.0,
                  color: Colors.green,
                ),
                IconButton.filled(
                  onPressed: () {},
                  icon: Icon(Icons.message),
                  iconSize: 33.0,
                ),
                IconButton.filled(
                  onPressed: () {},
                  icon: Icon(Icons.person),
                  iconSize: 33.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
