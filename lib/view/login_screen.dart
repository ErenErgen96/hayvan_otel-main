import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayvan_oteli/view/signup_screen.dart';
import 'package:hayvan_oteli/view/splash_screen.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _login(BuildContext context) async {
    final response = await http.post(
      Uri.parse('https://tarobot.net/taroapiarge/api/Shopper/LoginUser'),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "userName": usernameController.text,
        "password": passwordController.text,
      }),
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      if (responseBody['isSuccess'] == true) {
        Fluttertoast.showToast(msg: "Giriş Başarılı");
        print("Giriş başarılı oldu. Yanıt: ${response.body}");
        Get.to(() => SplashScreen());
      } else {
        Fluttertoast.showToast(msg: "Giriş Başarısız");
        print("Giriş başarısız oldu. Yanıt: ${response.body}");
      }
    } else {
      Fluttertoast.showToast(msg: "Giriş Başarısız");
      print("Giriş başarısız oldu. Yanıt: ${response.body}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
                controller: usernameController,
                decoration: InputDecoration(labelText: 'Username')),
            TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password')),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _login(context),
              child: Text('Login'),
            ),
            SizedBox(
              height: 16,
            ),
            TextButton(
                onPressed: () {
                  Get.to(() => SignUp());
                },
                child: Text("Kayıt Ol"))
          ],
        ),
      ),
    );
  }
}
