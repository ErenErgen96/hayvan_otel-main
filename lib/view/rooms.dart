import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoofScreen extends StatelessWidget {
  final String imagePath;

  RoofScreen({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Virtual Tour'.tr),
        //BURADA PANORAMA PAKETİ KULLANDIM AMA BU PAKETİ KULLANINCA APP'TEN ÇIKINCA BİR DAHA GİRİŞ YAPAMIYORUM BAŞKA ÇÖZÜM DENEYECEGİM
      ),
    );
  }
}
