import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/animal_model.dart';

class DetailViewModel extends GetxController{
  final int picker;
  DetailViewModel({required this.picker}){
    selectedAnimalIndex = picker;
  }
  int numberOfDays = 1;
  int selectedPackage = 1;
  double packageCoeffAlt = 1;
  double packageCoeffUst = 2;

  int selectedAnimalIndex = 0; 

 Animal get selectedAnimal => animals[selectedAnimalIndex];

 double calculatePrice() {
    double packageCoeff =
        selectedPackage == 1 ? packageCoeffUst : packageCoeffAlt;
    return selectedAnimal.basePrice * packageCoeff * numberOfDays;
  }
  
  List<Animal> animals = [
    Animal(
      imagePath: "assets/animals/dog.jpg",
      labelText: "Dog".tr,
      cardColor: Colors.lightGreen,
      basePrice: 20.0,
    ),
    Animal(
      imagePath: "assets/animals/cat.jpg",
      labelText: "Cat".tr,
      cardColor: Colors.orange,
      basePrice: 10.0,
    ),
    Animal(
      imagePath: "assets/animals/bird.jpg",
      labelText: "Bird".tr,
      cardColor: Colors.red,
      basePrice: 5.0,
    ),
    Animal(
      imagePath: "assets/animals/horse.jpg",
      labelText: "Horse".tr,
      cardColor: Colors.indigo,
      basePrice: 50.0,
    ),
  ];

  

}