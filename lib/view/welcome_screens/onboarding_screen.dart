import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayvan_oteli/view/welcome_screens/splash_screen.dart';

import '../../viewmodel/onboarding_viewmodel.dart';
class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
late PageController _pageController; 
  final OnboardingViewModel _viewModel = Get.put(OnboardingViewModel());

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
              itemCount:_viewModel.onboarding_datas.length,
              itemBuilder: (context, index) => OnboardContent(
                image: _viewModel.onboarding_datas[index].image,
                title: _viewModel.onboarding_datas[index].title,
                description: _viewModel.onboarding_datas[index].description,
              ),
            ),
                  ),
                  Row(
            children: [
              ...List.generate(_viewModel.onboarding_datas.length, (index) => Padding(
                padding: EdgeInsets.only(right: 4),
                child: DotIndicator(isActive: index == _pageIndex ),
                )),
              Spacer(),
              SizedBox(
                height: 60,
                width: 60,
                child: ElevatedButton(
  onPressed: () {
    if (_pageIndex == _viewModel.onboarding_datas.length - 1) {
      
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
