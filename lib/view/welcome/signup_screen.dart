import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayvan_oteli/view/welcome/login_screen.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class SignUp extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController usersirnameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  SignUp({super.key});

  void _signUp(BuildContext context) async {
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

  bool _checkNullValues() {
    return usernameController.text.isEmpty ||
        usersirnameController.text.isEmpty ||
        passwordController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneNumberController.text.isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up'.tr),
      centerTitle: true,
      backgroundColor: Colors.green,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Name'.tr),
              
            ),
            SizedBox(
              height: 8,
            ),
            TextField(
              controller: usersirnameController,
              decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Surname'.tr),
            ),
            SizedBox(
              height: 8,
            ),
            TextField(obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Password'.tr),
            ),
            SizedBox(
              height: 8,
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'E-mail'),
            ),
            SizedBox(
              height: 8,
            ),
            TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Phone Number'.tr),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _signUp(context),
              child: Text('Sign Up'.tr),
              style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green),)
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(GetMaterialApp(home: SignUp()));
}
