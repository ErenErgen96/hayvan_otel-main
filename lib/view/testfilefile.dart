import 'package:flutter/material.dart';

class TestFileFile extends StatefulWidget {
  const TestFileFile({Key? key}) : super(key: key);

  @override
  State<TestFileFile> createState() => _TestFileFileState();
}

class _TestFileFileState extends State<TestFileFile> {
 
  double basePrice = 10.0; 
  int selectedPackage = 1; 
  int numberOfDays = 1; 


  double packageCoeffAlt = 1.0;
  double packageCoeffUst = 2.0;

  
  double calculateTotalPrice() {
    double packageCoeff = selectedPackage == 1 ? packageCoeffAlt : packageCoeffUst;
    return basePrice * packageCoeff * numberOfDays;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hayvan Odası Kiralama'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SwitchListTile(
              title: Text('Alt Paketi Seçmek İster Misiniz?'),
              value: selectedPackage == 1,
              onChanged: (value) {
                setState(() {
                  selectedPackage = value ? 1 : 2;
                });
              },
            ),
            Container(height: 10,width: double.infinity,decoration: BoxDecoration(color: Colors.amber,borderRadius: BorderRadius.circular(10))),
            
            Row(
              children: [
                Text("Gün Sayısı"),
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
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Toplam Fiyat',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              '\$${calculateTotalPrice().toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

