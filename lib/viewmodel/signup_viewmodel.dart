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

  Future<void> signUp() async {
    if (_checkNullValues()) {
      Fluttertoast.showToast(msg: "Lütfen tüm alanları doldurun.");
      return;
    }

    if (phoneNumberController.text.length < 10) {
      Fluttertoast.showToast(msg: "Telefon numarası en az 10 karakter olmalıdır.");
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
