import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayvan_oteli/view/welcome/splash_screen.dart';
// ONPROGRESS
//kodlarımı mvvm ve provider kullanarak yeniden yapılandıracağım.
class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
late PageController _pageController; 
//final OnboardingViewModel viewModel = OnboardingViewModel();
int _pageIndex = 0;

//
 @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(children: [
                  Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged:(index) {
                setState(() {
                  _pageIndex = index;
                });
              },
              itemCount: onboarding_datas.length,
              itemBuilder: (context, index) => OnboardContent(
                image: onboarding_datas[index].image,
                title: onboarding_datas[index].title,
                description: onboarding_datas[index].description,
              ),
            ),
                  ),
                  Row(
            children: [
              ...List.generate(onboarding_datas.length, (index) => Padding(
                padding: EdgeInsets.only(right: 4),
                child: DotIndicator(isActive: index == _pageIndex ),
                )),
              Spacer(),
              SizedBox(
                height: 60,
                width: 60,
                child: ElevatedButton(
  onPressed: () {
    if (_pageIndex == onboarding_datas.length - 1) {
      
      Get.to(() => SplashScreen());
    } else {
      
      _pageController.nextPage(
        duration: Duration(milliseconds: 1000),
        curve: Curves.ease,
      );
    }
  },
  child: Icon(Icons.arrow_right),
  style: ElevatedButton.styleFrom(shape: CircleBorder()),
),

              ),
            ],
                  )
                ]),
          )),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    this.isActive = false,
  });
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: isActive ? 12 : 4,
      width: 4,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(12))
      ),
    );
  }
}

class OnBoard {
  final String image, title, description;
  OnBoard({
    required this.description,
    required this.title,
    required this.image
  });
}

final List<OnBoard>onboarding_datas = [
  OnBoard(description: "Welcome to the Animal Hotel app! By exploring our app, you can easily take advantage of all our services.".tr, title: "Welcome".tr + "!", image: "assets/onboarding/page1.avif"),
  OnBoard(description: "We welcome your pets with luxury accommodation and specialized care services.".tr, title: "Accommodation".tr + "!", image: "assets/onboarding/page2.avif"),
  OnBoard(description: "You can confidently leave your animal with us upon delivery. When you return from your vacation, a happy and healthy pet will be waiting for you!".tr, title: "Happy Ending".tr + "!", image: "assets/onboarding/page3.png"),
];

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Image.asset(image),
        Spacer(),
        Text(title,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30)),
        SizedBox(
          height: 16,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
        ),
        Spacer()
      ],
    );
  }
}
