import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayvan_oteli/view/home.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';
import 'onboarding_screen.dart';
// ON PROGRESS
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double imageSize = 100.0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 300), (timer) {
      if (imageSize < 300) {
        setState(() {
          imageSize += 10;
        });
      } else {
        timer.cancel();
        Get.to(() => HomePage());
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 3),
          curve: Curves.linear,
          height: imageSize,
          width: imageSize,
          child: Lottie.asset("assets/lottie/splash.json"),
        ),
      ),
    );
  }
}
