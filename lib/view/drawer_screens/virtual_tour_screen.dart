import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayvan_oteli/view/drawer_screens/rooms.dart';

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
        elevation: 4,
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text('Virtual Tour'.tr,style: TextStyle(fontWeight: FontWeight.bold,letterSpacing: 1),),
        shadowColor: Colors.grey,
        
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          ListTileForRooms(imagePathWay: 'assets/rooms/roof.jpg',roomName: "Roof",iconName: Icon(Icons.roofing),iconColor: Colors.indigo,),
          SizedBox(
            height: 10,
            
          ),
          ListTileForRooms(imagePathWay: 'assets/rooms/room1.jpg',roomName: "Room",iconName: Icon(Icons.hotel),iconColor: Colors.amber,),
          SizedBox(
            height: 10,
          ),
          ListTileForRooms(imagePathWay: 'assets/rooms/room2.jpg',roomName: "Room",iconName: Icon(Icons.hotel),iconColor: Colors.purple,),
          Padding(
            padding: const EdgeInsets.only(top: 38.0),
            child: Container(
              height: 100,
              child: Center(child: Text("Keşfetmeye Başla!",style: TextStyle(color: Colors.black87,fontSize: 24),)),
            ),
          ),
          
          
        ],
      ),
    );
  }
}

class ListTileForRooms extends StatelessWidget {
  final imagePathWay;
  final roomName;
  final iconName;
  final iconColor;
  const ListTileForRooms({
    super.key, this.imagePathWay, this.roomName, this.iconName, this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      iconColor: iconColor,
      hoverColor: Colors.green,
      tileColor: Colors.white38,
      shape: Border.all(),
      leading: iconName,
      title: Text("$roomName".tr),
      onTap: () {
        Get.to(() => RoofScreen(imagePath: imagePathWay));
      },
    );
  }
}
