//ONPROGRESS
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:hayvan_oteli/view/details_screen.dart';
import 'package:hayvan_oteli/view/live_camera_screen.dart';
import 'package:hayvan_oteli/view/virtual_tour_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:intl/intl.dart';

//import 'package:hayvan_oteli/view/communication_screen.dart';
//import 'package:flutter_svg/flutter_svg.dart';
//import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
  
}




class _HomePageState extends State<HomePage>  {

  final CarouselController _carouselController = CarouselController();
  String currentTime = '';

  @override
  void initState() {
    super.initState();
    updateQRCode();
  }

  void updateQRCode() {
    setState(() {
      currentTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    });

    Future.delayed(Duration(seconds: 5), () {
      updateQRCode();
    });
  }


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hayvan Oteli'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  CarouselSlider(
                    carouselController: _carouselController,
                    items: [
                      Image.asset('assets/animals/dog.jpg'),
                      Image.asset('assets/animals/cat.jpg'),
                      Image.asset('assets/animals/bird.jpg'),
                      Image.asset('assets/animals/horse.jpg'),
                    ],
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [Container(
                child: Padding(
                  padding: const EdgeInsets.only(top:24.0),
                  child: Text("QR Saat",style: TextStyle(color: Colors.green,fontSize: 18,fontWeight: FontWeight.bold),),
                ),
              ),
                QrImageView(data: currentTime,version: QrVersions.auto,size: 200,),
              ],
            )
          ],
        ),
        
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(image: AssetImage('assets/onboarding/page3.png'),fit: BoxFit.cover),
              ),
              child: Text(
                '',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),ListTile(
              leading: Icon(Icons.person,
              color: Colors.indigo,),
              title: Text("Profil"),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.camera_rear_sharp,
              color: Colors.green,),
              title: Text('Kameralar'),
              onTap: () {
                Navigator.pop(context); 
                Get.to(() => const LiveCameraScreen());
                //
              },
            ),
            ListTile(
              leading: Icon(Icons.camera_roll,
              color: Colors.amber,),
              title: Text('Tanıtım'),
              onTap: () {
                Navigator.pop(context); 
                Get.to(() => VirtualTour());
               
              },
            ),
            ListTile(
              leading: Icon(Icons.phone,
              color: Colors.red,),
              title: Text('İletişim'),
              onTap: () {
                Navigator.pop(context);
                 Get.bottomSheet(Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: Icon(Icons.phone),
                        title: const Text('Whatsapp'),
                        onTap: () async {
                          final Uri url = Uri.parse('https://wa.me/+905334497615');
                            if (!await launchUrl(url)) {
                              throw 'Bağlantı açılamadı: $url';
                            }
                        },
                        tileColor: Colors.greenAccent,
                        textColor: Colors.white,
                      ),
                      ListTile(
                        leading: const Icon(Icons.photo),
                        title: const Text('Instagram'),
                        onTap: () {
                          //instagramlinki
                        },
                        tileColor: Colors.amber,
                        textColor: Colors.white,
                      ),
                      ListTile(
                        leading: Icon(Icons.facebook),
                        title: Text("Facebook"),
                        onTap: (){
                          //facebooklinki
                        },
                        tileColor: Colors.blue,
                        textColor: Colors.white,
                      )
                    ],
                  ),
                ));
              },
            ),
          ],
        ),

      ),
      floatingActionButton: Column(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
    FloatingActionButton(
      onPressed: () {
        //FAB KAMERA MODEL ACTION
      },
      child: Icon(Icons.camera_alt),
      backgroundColor: Colors.blue,
    ),
    SizedBox(height: 16), 
    FloatingActionButton(
      onPressed: () {
        Get.to(() => DetailsScreen());
      },
      child: Icon(Icons.info_outline_rounded),
      backgroundColor: Colors.green,
    ),
  ],
),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    
      
    );
  }
 
}