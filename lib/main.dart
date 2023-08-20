import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hayvan_oteli/view/welcome_screens/onboarding_screen.dart';
import 'package:hayvan_oteli/view/welcome_screens/splash_screen.dart';
import 'package:hayvan_oteli/lang/lang_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool showOnboarding = prefs.getBool('showOnboarding') ?? true;

  runApp(MyApp(showOnboarding));
}

class MyApp extends StatefulWidget {
  final bool showOnboarding;

  const MyApp(this.showOnboarding, {Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    
    if (widget.showOnboarding) {
      SharedPreferences.getInstance().then((prefs) {
        prefs.setBool('showOnboarding', false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: LocalString(),
      locale: Get.deviceLocale, 
      fallbackLocale: Locale('en', 'US'),
      home: widget.showOnboarding ? OnBoardingScreen() : SplashScreen(),
    );
  }
}
