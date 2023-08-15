//ONPROGRESS
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:hayvan_oteli/view/live_camera_screen.dart';
import 'package:hayvan_oteli/view/detail_screen.dart';
import 'package:hayvan_oteli/view/virtual_tour_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:intl/intl.dart';

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
  final CarouselController _carouselController = CarouselController();
  String currentTime = '';
  late ImagePicker imagePicker;
  File? _image;
  String result = '';
  dynamic imageLabeler;
  String currentName = "Eren ERGEN";

  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
    final ImageLabelerOptions options =
        ImageLabelerOptions(confidenceThreshold: 0.5);
    imageLabeler = ImageLabeler(options: options);
    currentName = widget.accountOwner;
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

  List<int> carouselImageIndices = [0, 1, 2, 3];
  int currentCarouselIndex = 0;

  @override
  void dispose() {
    super.dispose();
    imageLabeler.close();
  }
  //kamera
  _imgFromCamera() async {
    XFile? pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
    _image = File(pickedFile!.path);
    setState(() {
      _image;
      doImageLabeling();
    });
  }
  
  
  //fotoğraf etiketleme
  doImageLabeling() async {
    result = "";
    final inputImage = InputImage.fromFile(_image!);
    final List<ImageLabel> labels = await imageLabeler.processImage(inputImage);

    double maxConfidence = 0;
    String maxConfidenceLabel = "";

    for (ImageLabel label in labels) {
      final String text = label.label;
      final double confidence = label.confidence;

      if (confidence > maxConfidence) {
        maxConfidence = confidence;
        maxConfidenceLabel = text;
      }

      result += "$text   ${confidence.toStringAsFixed(2)}\n";
      print("result += $text   ${confidence.toStringAsFixed(2)}\n");
    }

    setState(() {
      result;
    });

    // Navigasyon
    if (result.contains('Cat')) {
      Get.to(() => DetailScreen(
            picker: 1,
          ));
    } else if (result.contains('Horse')) {
      Get.to(() => DetailScreen(
            picker: 3,
          ));
    } else if (result.contains('Dog')) {
      Get.to(() => DetailScreen(
            picker: 0,
          ));
    } else if (result.contains('Bird')) {
      Get.to(() => DetailScreen(
            picker: 2,
          ));
    } else {
      Fluttertoast.showToast(msg: "Otelde barınabilecek bir hayvan bulunamadı!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animal Hotel'.tr),
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
                  data: currentTime,
                  version: QrVersions.auto,
                  size: 200,
                ),
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
              title: Text(currentName),
              onTap: () {
                Fluttertoast.showToast(
                    msg: "Welcome".tr + " " + "${currentName}");
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
                        onTap: () async {
                          final Uri url =
                              Uri.parse('https://wa.me/+905334497615');
                          if (!await launchUrl(url)) {
                            throw 'Could\'t load the page'.tr;
                          }
                        },
                        tileColor: Colors.greenAccent,
                        textColor: Colors.white,
                      ),
                      ListTile(
                        leading: const Icon(Icons.photo),
                        title: const Text('Instagram'),
                        onTap: () {
                          Fluttertoast.showToast(
                              msg: "İnstagram linki açıldı.");
                        },
                        tileColor: Colors.amber,
                        textColor: Colors.white,
                      ),
                      ListTile(
                        leading: Icon(Icons.facebook),
                        title: Text("Facebook"),
                        onTap: () {
                          Fluttertoast.showToast(msg: "Facebook linki açıldı.");
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
              _imgFromCamera();
            },
            child: Icon(Icons.camera_alt),
            backgroundColor: Colors.blue,
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              int selectedPicker = 0;
              if (currentCarouselIndex == 0) {
                selectedPicker = 0; // Köpek resmi
              } else if (currentCarouselIndex == 1) {
                selectedPicker = 1; // Kedi resmi
              } else if (currentCarouselIndex == 2) {
                selectedPicker = 2; // Kuş resmi
              } else if (currentCarouselIndex == 3) {
                selectedPicker = 3; // At resmi
              }

              Get.to(() => DetailScreen(picker: selectedPicker));
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
