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
        title: Text('360 Otel Turu'),
      ),
      body: Column(
        children: [
          ListTile(
            leading: Icon(Icons.roofing),
            title: Text("Çatı Katı"),
            onTap: () {
              Get.to(() => RoofScreen(imagePath: 'assets/rooms/roof.jpg'));
            },
          ),
          ListTile(
            leading: Icon(Icons.hotel),
            title: Text("Oda 1"),
            onTap: () {
              Get.to(() => RoofScreen(imagePath: 'assets/rooms/room1.jpg'));
            },
          ),
          ListTile(
            title: Text("Oda 2"),
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
