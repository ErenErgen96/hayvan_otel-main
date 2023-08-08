// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  double basePriceCat = 10.0; 
  double basePriceDog = 20.0; 
  double basePriceBird = 5.0; 
  double basePriceHorse = 50.0; 
  
  int selectedPackage1 = 1; 
  int selectedPackage2 = 1; 
  int selectedPackage3 = 1; 
  int selectedPackage4 = 1; 

  int numberOfDaysDog = 1; 
  int numberOfDaysCat = 1;
  int numberOfDaysHorse = 1;
  int numberOfDaysBird = 1;

  double packageCoeffAltDog = 1;
  double packageCoeffUstDog = 2;
  double packageCoeffAltCat = 1;
  double packageCoeffUstCat = 2;
  double packageCoeffAltHorse = 1;
  double packageCoeffUstHorse = 2;
  double packageCoeffAltBird = 1;
  double packageCoeffUstBird = 2;

   double calculateDogPrice() {
    double packageCoeff = selectedPackage1 == 1 ? packageCoeffUstDog : packageCoeffAltDog;
    return basePriceDog * packageCoeff * numberOfDaysDog;
  }
  double calculateCatPrice() {
    double packageCoeff = selectedPackage2 == 1 ? packageCoeffUstCat : packageCoeffAltCat;
    return basePriceCat * packageCoeff * numberOfDaysCat;
  }
  double calculateBirdPrice() {
    double packageCoeff = selectedPackage3 == 1 ? packageCoeffUstBird : packageCoeffAltBird;
    return basePriceBird * packageCoeff * numberOfDaysBird;
  }
  double calculateHorsePrice() {
    double packageCoeff = selectedPackage4 == 1 ? packageCoeffUstHorse : packageCoeffAltHorse;
    return basePriceHorse * packageCoeff * numberOfDaysHorse;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hayvan Oteli"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),body: ListView(
        children: [
          Container(
            color: Colors.lightGreenAccent,
            child: Column(
              children: [
                CardWidget(imagePath: "assets/animals/dog.jpg",labelText: "Köpek",cardColor: Colors.lightGreen, ),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("Gün Sayısı",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                    Slider(
                      value: numberOfDaysDog.toDouble(),
                      min: 1,
                      max: 30,
                      onChanged: (value) {
                        setState(() {
                          numberOfDaysDog = value.toInt();
                        });
                      },
                    ),Text(numberOfDaysDog.toString(), style: TextStyle(color: Colors.black87),)
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Switch(value: selectedPackage1 == 1, onChanged: (value){
                            setState(() {
                              selectedPackage1 = value ? 1 : 2;
                            });
                          }),Text("Üst Paket"),
                        ],
                      ),Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                                    'Toplam Fiyat:',
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                      ),
            Text(
              '\$${calculateDogPrice().toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
                    ],
                  ),
                )
              ],
            )
            ),
           Container(
            color: Colors.yellow,
            child: Column(
              children: [
                CardWidget(imagePath: "assets/animals/cat.jpg",labelText: "Kedi",cardColor: Colors.amber, ),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("Gün Sayısı",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                    Slider(
                      value: numberOfDaysCat.toDouble(),
                      min: 1,
                      max: 30,
                      onChanged: (value) {
                        setState(() {
                          numberOfDaysCat = value.toInt();
                        });
                      },
                    ),Text(numberOfDaysCat.toString(), style: TextStyle(color: Colors.black87),)
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Switch(value: selectedPackage2 == 1, onChanged: (value){
                            setState(() {
                              selectedPackage2 = value ? 1 : 2;
                            });
                          }),Text("Üst Paket"),
                        ],
                      ),Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                                    'Toplam Fiyat:',
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                      ),
            Text(
              '\$${calculateCatPrice().toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
                    ],
                  ),
                )
              ],
            )
            ),
            Container(
            color: Colors.redAccent,
            child: Column(
              children: [
                CardWidget(imagePath: "assets/animals/bird.jpg",labelText: "Kuş",cardColor: Colors.red, ),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("Gün Sayısı",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                    Slider(
                      value: numberOfDaysBird.toDouble(),
                      min: 1,
                      max: 30,
                      onChanged: (value) {
                        setState(() {
                          numberOfDaysBird = value.toInt();
                        });
                      },
                    ),Text(numberOfDaysBird.toString(), style: TextStyle(color: Colors.black87),)
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Switch(value: selectedPackage3 == 1, onChanged: (value){
                            setState(() {
                              selectedPackage3 = value ? 1 : 2;
                            });
                          }),Text("Üst Paket"),
                        ],
                      ),Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                                    'Toplam Fiyat:',
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                      ),
            Text(
              '\$${calculateBirdPrice().toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
                    ],
                  ),
                )
              ],
            )
            ),
            Container(
            color: Colors.lightBlueAccent,
            child: Column(
              children: [
                CardWidget(imagePath: "assets/animals/horse.jpg",labelText: "At",cardColor: Colors.indigo, ),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("Gün Sayısı",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                    Slider(
                      value: numberOfDaysHorse.toDouble(),
                      min: 1,
                      max: 30,
                      onChanged: (value) {
                        setState(() {
                          numberOfDaysHorse = value.toInt();
                        });
                      },
                    ),Text(numberOfDaysHorse.toString(), style: TextStyle(color: Colors.black87),)
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Switch(value: selectedPackage4 == 1, onChanged: (value){
                            setState(() {
                              selectedPackage4 = value ? 1 : 2;
                            });
                          }),Text("Üst Paket"),
                        ],
                      ),Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                                    'Toplam Fiyat:',
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                      ),
            Text(
              '\$${calculateHorsePrice().toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
                    ],
                  ),
                )
              ],
            )
            ),
            
          
        ],
      ),
      backgroundColor: Colors.white70,
    );
  }
}

class CardWidget extends StatelessWidget {
  
    final String imagePath;
    final String labelText;
    final cardColor;
    
  const CardWidget({
    Key? key,
    required this.cardColor,
    required this.imagePath,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.snackbar("Detay", "Detay Sayfası");
      },
      child: Card(
        elevation: 2,
        color: cardColor,
        margin: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage(imagePath),fit: BoxFit.cover)
                ),
                ),
                
              Column(
                children: [
                  Text(labelText,
                  style: TextStyle(fontSize: 24,color:Colors.white60 ),),
                ],
              ),
              Container(width: 30,)
            ],
          ),
        )
      ),
    );
  }
}
