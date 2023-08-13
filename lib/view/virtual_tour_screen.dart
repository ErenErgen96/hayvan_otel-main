import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayvan_oteli/view/rooms.dart';

class VirtualTour extends StatefulWidget {
  const VirtualTour({super.key});

  @override
  State<VirtualTour> createState() => _VirtualTourState();
}
 

class _VirtualTourState extends State<VirtualTour> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Virtual Tour'.tr),
      ),
      body: Column(
        children: [
          ListTile(
            leading: Icon(Icons.roofing),
            title: Text("Roof".tr),
            onTap: () {
              Get.to(() => RoofScreen(imagePath: 'assets/rooms/roof.jpg'));
            },
          ),
          ListTile(
            leading: Icon(Icons.hotel),
            title: Text("Room".tr + "1"),
            onTap: () {
              Get.to(() => RoofScreen(imagePath: 'assets/rooms/room1.jpg'));
            },
          ),
          ListTile(
            title: Text("Room".tr + "2"),
            leading: Icon(Icons.hotel),
            onTap: () {
              Get.to(() => RoofScreen(imagePath: 'assets/rooms/room2.jpg'));
            },
          ),
        ],
      ),
    );
  }
}
