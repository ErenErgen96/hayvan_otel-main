import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayvan_oteli/view/home.dart';
import 'package:hayvan_oteli/view/welcome/login_screen.dart';
import 'package:hayvan_oteli/view/onboarding_screen.dart';
import 'package:hayvan_oteli/view/welcome/signup_screen.dart';
import 'package:hayvan_oteli/view/welcome/welcome_screen.dart';

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
      home: (WelcomeScreen()),
    );
  }
}
