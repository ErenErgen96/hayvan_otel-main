import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayvan_oteli/view/welcome/login_screen.dart';
import 'package:hayvan_oteli/view/welcome/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.white,
            height: size.height,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  child: Container(
                    
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(50)),
                    padding: EdgeInsets.all(25),
                    child: Text("Animal Hotel".tr,style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),)),
                  top: 150,
                  ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Image.asset('assets/animals/dog_body.jpg', width: size.width * 0.3,),
                ),
                
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset('assets/animals/cat_body.jpg', width: size.width * 0.3,),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.green),
                      fixedSize: MaterialStateProperty.all(Size(size.width*0.8,20))),
                      onPressed: () {
                        Get.to(() => LoginScreen());
                      },
                      child: Text('Login'.tr),
                    ),
                    SizedBox(height: 20), 
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:MaterialStateProperty.all(Colors.green) ,
                        fixedSize: MaterialStateProperty.all(Size(size.width*0.8,20))),
                      onPressed: () {
                        Get.to(() => SignUp());
                      },
                      child: Text('Sign Up'.tr),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
