import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../viewmodel/splash_screen_view_model.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final viewModel = Get.put(SplashScreenViewModel());

  @override
  void initState() {
    super.initState();
    viewModel.startAnimationAndNavigate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => AnimatedContainer(
            duration: Duration(milliseconds: 300),
            curve: Curves.linear,
            height: viewModel.imageSize.value,
            width: viewModel.imageSize.value,
            child: Lottie.asset("assets/lottie/splash.json"),
          ),
        ),
      ),
    );
  }
}