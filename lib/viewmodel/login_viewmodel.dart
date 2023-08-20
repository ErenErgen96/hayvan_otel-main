import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../view/main_screens/home.dart';

class LoginViewModel extends GetxController{

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _checkNullValues() {
    return usernameController.text.isEmpty || passwordController.text.isEmpty;
  }

  void login(BuildContext context) async {
    if (_checkNullValues()) {
      Fluttertoast.showToast(msg: "Lütfen tüm alanları doldurun.");
      return;
    }
    final response = await http.post(
      Uri.parse('https://tarobot.net/taroapiarge/api/Shopper/LoginUser'),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "gsm": usernameController.text,
        "password": passwordController.text,
      }),
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      if (responseBody['isSuccess'] == true) {
        print("Giriş başarılı oldu. Yanıt: ${response.body}");
        late final responseName = responseBody['userName'];
        late final responseSurname = responseBody['userSurname'];
        Fluttertoast.showToast(
            msg: "Welcome".tr + " " + "${responseName} ${responseSurname}");

        Get.to(() => HomePage(
              accountOwner: "${responseName} ${responseSurname}",
            ));
      } else {
        Fluttertoast.showToast(msg: "Login failed".tr);
        print("Giriş başarısız oldu. Yanıt: ${response.body}");
      }
    } else {
      Fluttertoast.showToast(msg: "Login failed".tr);
      print("Giriş başarısız oldu. Yanıt: ${response.body}");
    }
  }
}