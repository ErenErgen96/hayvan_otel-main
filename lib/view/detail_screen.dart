import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DetailScreen extends StatefulWidget {
  final int picker;
  const DetailScreen({super.key, required this.picker});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

   
  
  List<Animal> animals = [
    Animal(
      imagePath: "assets/animals/dog.jpg",
      labelText: "Köpek",
      cardColor: Colors.lightGreen,
      basePrice: 20.0,
    ),
    Animal(
      imagePath: "assets/animals/cat.jpg",
      labelText: "Kedi",
      cardColor: Colors.orange,
      basePrice: 10.0,
    ),
    Animal(
      imagePath: "assets/animals/bird.jpg",
      labelText: "Kuş",
      cardColor: Colors.red,
      basePrice: 5.0,
    ),
    Animal(
      imagePath: "assets/animals/horse.jpg",
      labelText: "At",
      cardColor: Colors.indigo,
      basePrice: 50.0,
    ),
  ];

  
  int numberOfDays = 1;
  int selectedPackage = 1;

  double packageCoeffAlt = 1;
  double packageCoeffUst = 2;

  int selectedAnimalIndex = 0; 

  @override
  void initState() {
    super.initState();
    selectedAnimalIndex = widget.picker;
  }

  Animal get selectedAnimal => animals[selectedAnimalIndex];

  double calculatePrice() {
    double packageCoeff =
        selectedPackage == 1 ? packageCoeffUst : packageCoeffAlt;
    return selectedAnimal.basePrice * packageCoeff * numberOfDays;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.lightGreen),
      body: Container(
        color: Colors.blueGrey,
        child: Column(
          children: [
            Container(
              color: Colors.blueGrey,
              child: Column(children: [
                CardWidget(
                  imagePath: selectedAnimal.imagePath,
                  labelText: selectedAnimal.labelText,
                  cardColor: selectedAnimal.cardColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Number of the Days".tr,
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Slider(
                      value: numberOfDays.toDouble(),
                      min: 1,
                      max: 30,
                      onChanged: (value) {
                        setState(() {
                          numberOfDays = value.toInt();
                        });
                      },
                    ),
                    Text(
                      numberOfDays.toString(),
                      style: TextStyle(color: Colors.black87),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Switch(
                              value: selectedPackage == 1,
                              onChanged: (value) {
                                setState(() {
                                  selectedPackage = value ? 1 : 2;
                                });
                              }),
                          Text("Top Package".tr),
                        ],
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Total Price".tr + ":",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        '\$${calculatePrice().toStringAsFixed(2)}',
                        style:
                            TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: QrImageView(data: "${numberOfDays}" + "days for".tr + "${selectedAnimal.labelText} = \$${calculatePrice().toStringAsFixed(2)}"),
                )
              ]),
            ),
          ],
        ),
      ),
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
                      image: DecorationImage(
                          image: AssetImage(imagePath), fit: BoxFit.cover)),
                ),
                Column(
                  children: [
                    Text(
                      labelText,
                      style: TextStyle(fontSize: 24, color: Colors.white60),
                    ),
                  ],
                ),
                Container(
                  width: 30,
                )
              ],
            ),
          )),
    );
  }
}

class Animal {
  final String imagePath;
  final String labelText;
  final Color cardColor;
  final double basePrice;

  Animal({
    required this.imagePath,
    required this.labelText,
    required this.cardColor,
    required this.basePrice,
  });
}
