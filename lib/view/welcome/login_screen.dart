import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayvan_oteli/view/home.dart';
import 'package:hayvan_oteli/view/welcome/signup_screen.dart';
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
        Fluttertoast.showToast(msg:  "Giriş Başarılı Sayın ${responseName} ${responseSurname}");
        
        Get.to(() => HomePage(accountOwner: "${responseName} ${responseSurname}",));
        
        
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
      appBar: AppBar(title: Text('Giriş Yap'),
      centerTitle: true,
      backgroundColor: Colors.green,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: "Kullanıcı Adınızı Giriniz.",
                  labelText: 'Kullanıcı Adı'),
                  ),
            TextField(
              obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: "Şifrenizi Giriniz",
                  labelText: 'Şifre')),
            SizedBox(height: 16),
            ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),

              onPressed: () => _login(context),
              child: Text('Giriş yap'),
            ),
            SizedBox(
              height: 16,
            ),
            Text("Hesabınız yok mu?",style: TextStyle(color: Colors.black.withAlpha(150)),),
            TextButton(
              style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.green)),
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
