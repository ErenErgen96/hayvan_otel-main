import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayvan_oteli/view/welcome_screens/login_screen.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

import '../../viewmodel/signup_viewmodel.dart';

class SignUp extends StatelessWidget {

  SignUp({super.key});

 final SignUpViewModel viewModel = SignUpViewModel();
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
              controller: viewModel.usernameController,
              decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Name'.tr),
              
            ),
            SizedBox(
              height: 8,
            ),
            TextField(
              controller: viewModel.usersirnameController,
              decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Surname'.tr),
            ),
            SizedBox(
              height: 8,
            ),
            TextField(obscureText: true,
              controller: viewModel.passwordController,
              decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Password'.tr),
            ),
            SizedBox(
              height: 8,
            ),
            TextField(
              controller: viewModel.emailController,
              decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'E-mail'),
            ),
            SizedBox(
              height: 8,
            ),
            TextField(
              controller: viewModel.phoneNumberController,
              decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Phone Number'.tr),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => viewModel.signUp(),
              child: Text('Sign Up'.tr),
              style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green),)
            ),
          ],
        ),
      ),
    );
  }
}

