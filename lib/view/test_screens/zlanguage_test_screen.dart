import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageTestScreen extends StatelessWidget {
  const LanguageTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Container(
                child: Text("welcome".tr),
              ),
            ),
            TextButton(onPressed: (){
              var currentLocale = Get.locale;
              var newLocale = currentLocale?.languageCode == 'tr' ? Locale('en', 'US') : Locale('tr', 'TR');
              Get.updateLocale(newLocale);
            }, child: Text("Change Language"))
          ],
        ),
      ),
      
    );
  }
}