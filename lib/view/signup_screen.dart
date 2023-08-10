import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayvan_oteli/view/login_screen.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class SignUp extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController usersirnameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  SignUp({super.key});

  String dateTimeNow = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

  void _signUp(BuildContext context) async {
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
        "qrid": dateTimeNow,
      }),
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      if (responseBody['isSuccess'] == true) {
        String responseMsg = responseBody['responseMsg'];

        Fluttertoast.showToast(msg: " $responseMsg");
        Get.to(() => LoginScreen());
      } else {
        String responseMsg = responseBody['responseMsg'];
        print("Kayıt başarısız oldu. Yanıt: $responseMsg");
        Fluttertoast.showToast(msg: "Kayıt Başarısız Oldu! $responseMsg");
      }
    } else {
      print("Kayıt başarısız oldu. Yanıt: ${response.body}");
      Fluttertoast.showToast(msg: "Kayıt Başarısız Oldu!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
                controller: usernameController,
                decoration: InputDecoration(labelText: 'İsim')),
            TextField(
                controller: usersirnameController,
                decoration: InputDecoration(labelText: 'Soyisim')),
            TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password')),
            TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email')),
            TextField(
                controller: phoneNumberController,
                decoration: InputDecoration(labelText: 'Phone Number')),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _signUp(context),
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
