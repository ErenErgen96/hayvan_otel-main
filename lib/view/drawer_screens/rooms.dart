import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayvan_oteli/view/drawer_screens/profile_screen.dart';
import 'package:panorama/panorama.dart';

class RoofScreen extends StatelessWidget {
  final String imagePath;

  RoofScreen({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(() => ProfileScreen());
            },
            child: Padding(
              padding: const EdgeInsets.all(9.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 8.0,
                    ),
                  ],
                ),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/animals/cat.jpg'), 
                  radius: 20,
                ),
              ),
            ),
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 4,
        title: Text('Virtual Tour'.tr),
        
      ),
      body: Center(
        child: Panorama(
          child: Image.asset(imagePath),
        ),
      ),
    );
  }
}
