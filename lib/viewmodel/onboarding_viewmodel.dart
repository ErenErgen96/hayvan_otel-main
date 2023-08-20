
import 'package:get/get.dart';
import '../model/onboarding_model.dart';

class OnboardingViewModel extends GetxController {

  final List<OnBoard>onboarding_datas = [
  OnBoard(description: "Welcome to the Animal Hotel app! By exploring our app, you can easily take advantage of all our services.".tr, title: "Welcome".tr + "!", image: "assets/onboarding/page1.avif"),
  OnBoard(description: "We welcome your pets with luxury accommodation and specialized care services.".tr, title: "Accommodation".tr + "!", image: "assets/onboarding/page2.avif"),
  OnBoard(description: "You can confidently leave your animal with us upon delivery. When you return from your vacation, a happy and healthy pet will be waiting for you!".tr, title: "Happy Ending".tr + "!", image: "assets/onboarding/page3.png"),
];
}
