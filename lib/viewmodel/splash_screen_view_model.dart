import 'dart:async';

import 'package:get/get.dart';

import '../view/welcome_screens/welcome_screen.dart';

class SplashScreenViewModel extends GetxController {
  RxDouble imageSize = RxDouble(100.0);

  void startAnimationAndNavigate() {
    Timer.periodic(Duration(milliseconds: 300), (timer) {
      if (imageSize.value < 300) {
        imageSize.value += 10;
        update();
      } else {
        timer.cancel();
        Get.off(() => WelcomeScreen());
      }
    });
  }

  @override
  void onClose() {
    imageSize.close();
    super.onClose();
  }
}