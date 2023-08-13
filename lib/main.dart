import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayvan_oteli/view/welcome/onboarding_screen.dart';
import 'package:hayvan_oteli/view/welcome/welcome_screen.dart';
import 'package:hayvan_oteli/lang/lang_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: LocalString(),
      locale: Get.deviceLocale, 
      fallbackLocale: Locale('en', 'US'),
      home: (OnBoardingScreen()),
    );
  }
}
