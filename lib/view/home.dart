//ONPROGRESS
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:hayvan_oteli/view/communication_screen.dart';
//import 'package:flutter_svg/flutter_svg.dart';

//import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hayvan Oteli'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider(
                items: [
                  Image.asset('assets/onboarding/page2.avif'),
                  Image.asset('assets/onboarding/page1.avif'),
                  Image.asset('assets/onboarding/page3.png'),
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
                Navigator.pop(context); // Drawer kapatılır
                //
              },
            ),
            ListTile(
              leading: Icon(Icons.camera_roll,
              color: Colors.amber,),
              title: Text('Tanıtım'),
              onTap: () {
                Navigator.pop(context); // Drawer kapatılır
                // Tanıtım ekranına yönlendirme yapılabilir
              },
            ),
            ListTile(
              leading: Icon(Icons.phone,
              color: Colors.red,),
              title: Text('İletişim'),
              onTap: () {
                Navigator.pop(context); // Drawer kapatılır
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // onpressed
          
               
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green, 
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      
    );
  }
 
}