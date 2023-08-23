import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hayvan_oteli/view/drawer_screens/live_camera_screen.dart';
import 'package:hayvan_oteli/view/drawer_screens/virtual_tour_screen.dart';
import 'package:hayvan_oteli/viewmodel/home_viewmodel.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'detail_screen.dart';

//import 'package:hayvan_oteli/view/communication_screen.dart';
//import 'package:flutter_svg/flutter_svg.dart';
//import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class HomePage extends StatefulWidget {
  final String accountOwner;
  const HomePage({super.key, required this.accountOwner});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeViewModel viewModel = Get.put(HomeViewModel());
  List<int> carouselImageIndices = [0, 1, 2, 3];
  int currentCarouselIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animal Hotel'.tr),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    CarouselSlider(
                      carouselController: viewModel.carouselController,
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
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentCarouselIndex = index;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: Text(
                        "QR Time".tr,
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  QrImageView(
                    data: viewModel.currentTime,
                    version: QrVersions.auto,
                    size: 200,
                  ),
                ],
              )
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
                image: DecorationImage(
                    image: AssetImage('assets/onboarding/page3.png'),
                    fit: BoxFit.cover),
              ),
              child: Text(
                '',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.indigo,
              ),
              title: Text(widget.accountOwner),
              onTap: () {
                Fluttertoast.showToast(
                    msg: "Welcome".tr + " " + "${widget.accountOwner}");
              },
            ),
            ListTile(
              leading: Icon(
                Icons.camera_rear_sharp,
                color: Colors.green,
              ),
              title: Text('Cameras'.tr),
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const LiveCameraScreen());
                //
              },
            ),
            ListTile(
              leading: Icon(
                Icons.camera_roll,
                color: Colors.amber,
              ),
              title: Text('Advertisement'.tr),
              onTap: () {
                Navigator.pop(context);
                Get.to(() => VirtualTour());
              },
            ),
            ListTile(
              leading: Icon(
                Icons.phone,
                color: Colors.red,
              ),
              title: Text('Contact'.tr),
              onTap: () {
                Navigator.pop(context);
                Get.bottomSheet(Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: Icon(Icons.phone),
                        title: const Text('Whatsapp'),
                        onTap: () {
                          viewModel
                              .launchableUrls('https://wa.me/+905334497615');
                        },
                        tileColor: Colors.greenAccent,
                        textColor: Colors.white,
                      ),
                      ListTile(
                        leading: const Icon(Icons.photo),
                        title: const Text('Instagram'),
                        onTap: () {
                          viewModel.launchableUrls(
                              'https://www.instagram.com/asisotomasyon/');
                        },
                        tileColor: Colors.amber,
                        textColor: Colors.white,
                      ),
                      ListTile(
                        leading: Icon(Icons.facebook),
                        title: Text("Facebook"),
                        onTap: () {
                          viewModel.launchableUrls(
                              "https://www.facebook.com/asisotomasyon/?locale=tr_TR");
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
            heroTag: "Camera Button",
            onPressed: () {
              //FAB KAMERA MODEL ACTION
              viewModel.imgFromGallery();
            },
            child: Icon(Icons.camera_alt),
            backgroundColor: Colors.blue,
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            heroTag: "Details Button",
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildAnimalButton(
                          'Dog'.tr,
                          "assets/animals/dog.jpg",
                          () => viewModel.navigateToDetailScreen(0),
                        ),
                        _buildAnimalButton(
                          'Cat'.tr,
                          "assets/animals/cat.jpg",
                          () => viewModel.navigateToDetailScreen(1),
                        ),
                        _buildAnimalButton(
                          'Bird'.tr,
                          "assets/animals/bird.jpg",
                          () => viewModel.navigateToDetailScreen(2),
                        ),
                        _buildAnimalButton(
                          'Horse'.tr,
                          "assets/animals/horse.jpg",
                          () => viewModel.navigateToDetailScreen(3),
                        ),
                      ],
                    ),
                  );
                },
              );
              /*  int selectedPicker = 0;
              if (currentCarouselIndex == 0) {
                selectedPicker = 0; // Köpek resmi
              } else if (currentCarouselIndex == 1) {
                selectedPicker = 1; // Kedi resmi
              } else if (currentCarouselIndex == 2) {
                selectedPicker = 2; // Kuş resmi
              } else if (currentCarouselIndex == 3) {
                selectedPicker = 3; // At resmi
              }

              Get.to(() => DetailScreen(picker: selectedPicker));*/
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

Widget _buildAnimalButton(
    String animalName, String imagePath, VoidCallback onPressed) {
  return Container(decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
    child: ListTile(
      trailing: Icon(Icons.pets),
      horizontalTitleGap: 12,
      visualDensity: VisualDensity.standard,
      leading: CircleAvatar(
                      backgroundImage: AssetImage(imagePath)
                          as ImageProvider,
                    ),
      title: Text(animalName),
      onTap: onPressed,
    ),
  );
}
