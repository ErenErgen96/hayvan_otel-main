import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayvan_oteli/view/main_screens/home.dart';
import 'package:hayvan_oteli/view/welcome_screens/signup_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hayvan_oteli/viewmodel/login_viewmodel.dart';

class LoginScreen extends StatelessWidget {
  
  final LoginViewModel viewModel = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'.tr),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: viewModel.usernameController,
              decoration: InputDecoration(
                  hintText: "Enter Your Username".tr, labelText: 'Username'.tr),
            ),
            TextField(
                obscureText: true,
                controller: viewModel.passwordController,
                decoration: InputDecoration(
                    hintText: "Enter Your Password".tr,
                    labelText: 'Password'.tr)),
            SizedBox(height: 16),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              onPressed: () => viewModel.login(context),
              child: Text('Login'.tr),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "You do not have an account?".tr,
              style: TextStyle(color: Colors.black.withAlpha(150)),
            ),
            TextButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.green)),
                onPressed: () {
                  Get.to(() => SignUp());
                },
                child: Text("Sign Up".tr))
          ],
        ),
      ),
    );
  }
}
