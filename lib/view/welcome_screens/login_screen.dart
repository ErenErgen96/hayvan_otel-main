
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayvan_oteli/view/welcome_screens/signup_screen.dart';
import 'package:hayvan_oteli/viewmodel/login_viewmodel.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginViewModel viewModel = Get.put(LoginViewModel());
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isSecurePassword = true;
  bool rememberMeChecked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'.tr),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
              padding: const EdgeInsets.only(bottom:48, top: 12),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.7),
                      blurRadius: 128.0,
                    ),
                  ],
                ),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/onboarding/page3.png'), 
                  radius: 120,
                ),
              ),
            ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Email";
                    }
                    return null;
                  },
                  controller: viewModel.usernameController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(),
                      hintText: "Enter Your Phone Number".tr,
                      labelText: 'Phone Number'.tr),
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Password";
                      }
                      return null;
                    },
                    obscureText: isSecurePassword,
                    controller: viewModel.passwordController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(),
                        suffixIcon: togglePassword(),
                        hintText: "Enter Your Password".tr,
                        labelText: 'Password'.tr)),
                SizedBox(height: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green)),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (rememberMeChecked) {
                            viewModel.rememberMe(
                                viewModel.usernameController.text,
                                viewModel.passwordController.text);
                          }
                          viewModel.login(context);
                        }
                      },
                      child: Text('Login'.tr),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Remember Me".tr + "!",
                          style: TextStyle(color: Colors.black.withAlpha(150)),
                        ),
                        Checkbox(
                            checkColor: Colors.white,
                            activeColor: Colors.grey,
                            value: rememberMeChecked,
                            onChanged: (value) {
                              setState(() {
                                rememberMeChecked = value!;
                              });
                            }),
                      ],
                    ),
                  ],
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
                        foregroundColor:
                            MaterialStateProperty.all(Colors.green)),
                    onPressed: () {
                      Get.to(() => SignUp());
                    },
                    child: Text("Sign Up".tr))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget togglePassword() {
    return IconButton(
      onPressed: () {
        setState(() {
          isSecurePassword = !isSecurePassword;
        });
      },
      icon: isSecurePassword
          ? Icon(
              Icons.visibility_off,
              color: Colors.grey,
            )
          : Icon(Icons.visibility),
      color: Colors.blue,
    );
  }

  
}

