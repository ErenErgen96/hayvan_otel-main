import 'dart:io';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
//EXPERIMENTAL
//EXPERIMENTAL
//EXPERIMENTAL
//EXPERIMENTAL
//EXPERIMENTAL
//EXPERIMENTAL
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ImagePicker imagePicker;
  File? image;

  imgFromGallery() async {
    imagePicker = ImagePicker();
    XFile? pickedFile =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Experimental'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: imgFromGallery,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 24.0,
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    backgroundImage: image != null
                        ? FileImage(image!)
                        : AssetImage('assets/icons/profile.png') as ImageProvider,
                    radius: 140,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (image != null) {
                  // Resim kaydetme
                } else {
                  Get.snackbar('Hata', 'Lütfen önce bir fotoğraf seçin.');
                }
              },
              child: Text('Kaydet'),
            ),
          ],
        ),
      ),
    );
  }
}
