import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayvan_oteli/view/welcome_screens/login_screen.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

import '../../viewmodel/signup_viewmodel.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final SignUpViewModel viewModel = SignUpViewModel();
  bool isSecurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'.tr),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                keyboardType: TextInputType.name,
                controller: viewModel.usernameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Name'.tr),
              ),
              SizedBox(
                height: 8,
              ),
              TextField(
                keyboardType: TextInputType.name,
                controller: viewModel.usersirnameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Surname'.tr),
              ),
              SizedBox(
                height: 8,
              ),
              TextField(
                obscureText: isSecurePassword,
                controller: viewModel.passwordController,
                decoration: InputDecoration(
                    suffixIcon: togglePassword(),
                    border: OutlineInputBorder(),
                    labelText: 'Password'.tr),
              ),
              SizedBox(
                height: 8,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: viewModel.emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'E-mail'),
              ),
              SizedBox(
                height: 8,
              ),
              TextField(
                keyboardType: TextInputType.phone,
                controller: viewModel.phoneNumberController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Phone Number'.tr),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                  onPressed: () => viewModel.signUp(),
                  child: Text('Sign Up'.tr),
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.green),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget togglePassword(){
    
    return IconButton(onPressed: (){
      setState(() {
    isSecurePassword = !isSecurePassword;
    });
    }, icon: isSecurePassword ? Icon(Icons.visibility_off) : Icon(Icons.visibility), color: Colors.blue,);
  }
}
