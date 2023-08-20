import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../viewmodel/detail_viewmodel.dart';

class DetailScreen extends StatefulWidget {
  final int picker;
  const DetailScreen({super.key, required this.picker});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late DetailViewModel viewModel; 
  
  @override
  void initState() {
    super.initState();
    viewModel = Get.put(DetailViewModel(picker: widget.picker));
    
  }

  

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green,title: Text("Hayvan Oteli".tr),centerTitle: true,),
      body: Container(
        color: Colors.blueGrey,
        child: Column(
          children: [
            Container(
              color: Colors.blueGrey,
              child: Column(children: [
                CardWidget(
                  imagePath: viewModel.selectedAnimal.imagePath,
                  labelText: viewModel.selectedAnimal.labelText,
                  cardColor: viewModel.selectedAnimal.cardColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Number of the Days".tr,
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Slider(
                      value: viewModel.numberOfDays.toDouble(),
                      min: 1,
                      max: 30,
                      onChanged: (value) {
                        setState(() {
                          viewModel.numberOfDays = value.toInt();
                        });
                      },
                    ),
                    Text(
                      viewModel.numberOfDays.toString(),
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
                              value: viewModel.selectedPackage == 1,
                              onChanged: (value) {
                                setState(() {
                                  viewModel.selectedPackage = value ? 1 : 2;
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
                        '\$${viewModel.calculatePrice().toStringAsFixed(2)}',
                        style:
                            TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),Text("Rezervasyon için qr kodunu okutunuz", style: TextStyle(fontSize: 18, color: Colors.white,fontStyle: FontStyle.italic, fontWeight: FontWeight.w300),),
                Padding(
                  padding: const EdgeInsets.only(top:16.0,bottom: 32,left: 32,right: 32),
                  child: QrImageView(data: "${viewModel.numberOfDays}" + " " + "days for".tr + " " + "${viewModel.selectedAnimal.labelText} = \$${viewModel.calculatePrice().toStringAsFixed(2)}"),
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
        Get.snackbar("Detay", "Test:/Burada tıklayarak daha da detay sayfasına gidilebilir");
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

