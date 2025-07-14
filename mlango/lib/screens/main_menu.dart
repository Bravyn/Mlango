import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mlango/screens/home_screen.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  File? _profileImage;
  DateTime? _workStartTime;
  List<Map<String, dynamic>> _workSessions = [];

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickNewImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );

    if (!mounted) return; //guard context

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
      Navigator.of(context).pop; //close pop up modal of user picks the picture
    }
  }

  void _showProfileDialog() {
    showDialog(
      context: context,
      builder:
          (_) => Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child:
                        _profileImage != null
                            ? Image.file(
                              _profileImage!,
                              height: 440,
                              fit: BoxFit.cover,
                            )
                            : Image.asset(
                              'assets/images/pf.jpg',
                              height: 440,
                              fit: BoxFit.cover,
                            ),
                  ),
                  SizedBox(height: 16),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround),
                ],
              ),
            ),
          ),
    );
  }
//WORK BUTTON ON PRESSED CALLBACK
  void _toggleWorkSessions(){
    if (_workStartTime == null ){
      //start a work session
      setState(() {
        _workStartTime = DateTime.now();
        _getCurrentPosition().then((position) {
          if (position != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("📍 Location: ${position.latitude}, ${position.longitude}"),
              ),
            );
          }
        });

      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("🕐 Clocked in at ${_workStartTime!.hour}:${_workStartTime!.minute.toString().padLeft(2, '0')}")),
        );
    } else {
      //stop the work session
      final endTime = DateTime.now();
      final duration = endTime.difference(_workStartTime!);
      setState(() {
        _workSessions.add({
          'start': _workStartTime,
          'end': endTime,
          'duration': duration,
        });
        _workStartTime = null;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("🕐 Clocked out at ${endTime.hour}:${endTime.minute.toString().padLeft(2, '0')}"),
        ),
      );
    }
  }

  Future<Position?> _getCurrentPosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Location services are disabled. Please enable them.")),
      );
      return null;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Location permission denied"))
          );
        return null;
        
      }
    }
    return await Geolocator.getCurrentPosition(locationSettings: LocationSettings(
      accuracy: LocationAccuracy.best,
      distanceFilter: 10,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //background image
          Positioned.fill(
            child: Image.asset('assets/images/bg2.jpg', fit: BoxFit.cover),
          ),

          //top row with button and avatar
          Positioned(
            top: 40,
            right: 20,
            left: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //AT WORK BUTTON
                ElevatedButton(
                  onPressed: _toggleWorkSessions,
                      
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(_workStartTime == null ? "AT WORK" : "STOP WORK"),
                      Icon(_workStartTime == null ? Icons.laptop : Icons.stop_circle)
                      ],
                  ),
                ),

                //Profile avatar with Tap
                GestureDetector(
                  onTap: _showProfileDialog,
                  child: CircleAvatar(
                    radius: 26,
                    backgroundImage:
                        _profileImage != null
                            ? FileImage(_profileImage!)
                            : AssetImage("assets/images/pf.jpg")
                                as ImageProvider,
                  ),
                ),
              ],
            ),
          ),

          // bottom menu items
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.home), iconSize: 22,),
                SizedBox(width: 20,),
                IconButton(onPressed: () {}, icon: Icon(Icons.person), iconSize: 22,),
                SizedBox(width: 20,),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.check_box_outline_blank_outlined, ), iconSize: 22),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
