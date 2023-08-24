import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hayvan_oteli/view/welcome_screens/login_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUpViewModel extends GetxController {
  final usernameController = TextEditingController();
  final usersirnameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();

  final List<String> messages = [
   "Modern pizza, Italy's Napoli city is where it originated.".tr + "     ",
  "Electricity and magnetism are actually two interconnected forces.".tr + "     ",
  "The largest planet in the solar system is Jupiter, and the Great Red Spot on it has been a storm system for years.".tr + "     ",
  "Sushi is considered the national dish of Japan and is actually made with vinegar-femented rice.".tr + "     ",
  "One of the most spoken languages, Mandarin Chinese allows the same vowel sound to carry different meanings based on tones.".tr + "     ",
  "The first mobile phones were not as portable as today's devices and were large and heavy.".tr + "     ",
  "William Shakespeare is the most prolific writer in English and popularized many modern idioms.".tr + "     ",
  "Skipping breakfast is thought to slow down metabolism and lead to weight gain.".tr + "     ",
  "Bees contribute to plant reproduction by aiding in the transfer of pollen among flowers.".tr + "     "
];

  void changeMessage() {
    String lastMessage = messages.removeLast();
    messages.insert(0, lastMessage);
  }
  
  var obscureText = true.obs;

  void toggleObscureText() {
    obscureText.toggle();
    update();
  }

  Future<void> signUp() async {

    if (usernameController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Lütfen adınızı girin.");
      return;
    }

    if (usersirnameController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Lütfen soyadınızı girin.");
      return;
    }

    if (passwordController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Lütfen şifrenizi girin.");
      return;
    }

    if (emailController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Lütfen e-posta adresinizi girin.");
      return;
    }

    if (phoneNumberController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Lütfen telefon numaranızı girin.");
      return;
    }

    if (phoneNumberController.text.length < 10) {
      Fluttertoast.showToast(
          msg: "Telefon numarası en az 10 karakter olmalıdır.");
      return;
    }

    final response = await http.post(
      Uri.parse('https://tarobot.net/taroapiarge/api/Shopper/RegisterUser'),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "sifre": passwordController.text,
        "gsm": phoneNumberController.text,
        "kullaniciAd": usernameController.text,
        "kullaniciSoyad": usersirnameController.text,
        "eposta": emailController.text,
        "qrid": "",
      }),
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      if (responseBody['isSuccess'] == true) {
        String responseMsg = responseBody['responseMsg'];
        print("Kayıt Başarılı Oldu: ${response.body}");
        Get.to(() => LoginScreen());
      } else {
        String responseMsg = responseBody['responseMsg'];
        print("Kayıt başarısız oldu. Yanıt: $responseMsg");
      }
    } else {
      print("Kayıt başarısız oldu. Yanıt: ${response.body}");
    }
  }

  bool _checkNullValues() {
    return usernameController.text.isEmpty ||
        usersirnameController.text.isEmpty ||
        passwordController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneNumberController.text.isEmpty;
  }

  
}
