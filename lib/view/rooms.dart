import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panorama/panorama.dart';

class RoofScreen extends StatelessWidget {
  final String imagePath;

  RoofScreen({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
