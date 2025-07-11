import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mlango/screens/home_screen.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  File? _profileImage;
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
                  ElevatedButton.icon(
                    onPressed: _pickNewImage,
                    icon: Icon(Icons.photo_library),
                    label: Text("Change Picture"),
                  ),
                ],
              ),
            ),
          ),
    );
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
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [Text("AT WORK"), Icon(Icons.laptop)],
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [IconButton(onPressed: () {}, icon: Icon(Icons.home))],
            ),
          ),
        ],
      ),
    );
  }
}
