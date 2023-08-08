// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hayvan_oteli/view/testfilefile.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  double basePrice = 10.0; 
  int selectedPackage = 1; 
  int numberOfDays = 1; 

  double packageCoeffAlt = 1;
  double packageCoeffUst = 2;

   double calculateTotalPrice() {
    double packageCoeff = selectedPackage == 1 ? packageCoeffUst : packageCoeffAlt;
    return basePrice * packageCoeff * numberOfDays;
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
                      value: numberOfDays.toDouble(),
                      min: 1,
                      max: 30,
                      onChanged: (value) {
                        setState(() {
                          numberOfDays = value.toInt();
                        });
                      },
                    ),Text(numberOfDays.toString(), style: TextStyle(color: Colors.black87),)
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Switch(value: selectedPackage == 1, onChanged: (value){
                            setState(() {
                              selectedPackage = value ? 1 : 2;
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
              '\$${calculateTotalPrice().toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
                    ],
                  ),
                )
              ],
            )
            ),
          CardWidget(imagePath: "assets/animals/cat.jpg",labelText: "Kedi", cardColor: Colors.amber, ),
          CardWidget(imagePath: "assets/animals/bird.jpg",labelText: "Kuş", cardColor: Colors.red, ),
          CardWidget(imagePath: "assets/animals/horse.jpg",labelText: "At", cardColor: Colors.indigo, ),
          
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
        Get.to(() => const TestFileFile());
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
