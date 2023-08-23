import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../viewmodel/signup_viewmodel.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Name".tr;
                    }
                    return null;
                  },
                  keyboardType: TextInputType.name,
                  controller: viewModel.usernameController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                      labelText: 'Name'.tr),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Surname".tr;
                    }
                    return null;
                  },
                  keyboardType: TextInputType.name,
                  controller: viewModel.usersirnameController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                      labelText: 'Surname'.tr),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Password".tr;
                    }
                    return null;
                  },
                  obscureText: isSecurePassword,
                  controller: viewModel.passwordController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: togglePassword(),
                      border: OutlineInputBorder(),
                      labelText: 'Password'.tr),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter E-mail".tr;
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  controller: viewModel.emailController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.mail),
                      border: OutlineInputBorder(),
                      labelText: 'E-mail'),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Phone Number".tr;
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                  controller: viewModel.phoneNumberController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(),
                      labelText: 'Phone Number'.tr),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        viewModel.signUp();
                      }
                    },
                    child: Text('Sign Up'.tr),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.green),
                    )),
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
