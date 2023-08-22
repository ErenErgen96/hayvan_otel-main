import 'dart:io';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:hayvan_oteli/view/main_screens/detail_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeViewModel extends GetxController {
  final CarouselController carouselController = CarouselController();
  String currentTime = '';
  late ImagePicker imagePicker;
  File? image;
  String result = '';
  dynamic imageLabeler;
  String currentName = "Eren ERGEN";
  void navigateToDetailScreen(int selectedPicker) {
    Get.back();
    Get.to(() => DetailScreen(picker: selectedPicker));
  }

  HomeViewModel() {
    final ImageLabelerOptions options =
        ImageLabelerOptions(confidenceThreshold: 0.5);
    imageLabeler = ImageLabeler(options: options);
    updateQRCode();
  }

  void updateQRCode() {
    currentTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    Future.delayed(Duration(seconds: 5), () {
      updateQRCode();
    });
  }

  imgFromCamera() async {
    imagePicker = ImagePicker();
    XFile? pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
    image = File(pickedFile!.path);

    doImageLabeling();
  }

  //fotoğraf etiketleme
  doImageLabeling() async {
    result = "";
    final inputImage = InputImage.fromFile(image!);
    final List<ImageLabel> labels = await imageLabeler.processImage(inputImage);

    double maxConfidence = 0;
    String maxConfidenceLabel = "";

    for (ImageLabel label in labels) {
      final String text = label.label;
      final double confidence = label.confidence;

      if (confidence > maxConfidence) {
        maxConfidence = confidence;
        maxConfidenceLabel = text;
      }

      result += "$text   ${confidence.toStringAsFixed(2)}\n";
      print("result += $text   ${confidence.toStringAsFixed(2)}\n");
    }

    // Navigasyon
    if (result.contains('Cat')) {
      Get.to(() => DetailScreen(
            picker: 1,
          ));
    } else if (result.contains('Horse')) {
      Get.to(() => DetailScreen(
            picker: 3,
          ));
    } else if (result.contains('Dog')) {
      Get.to(() => DetailScreen(
            picker: 0,
          ));
    } else if (result.contains('Bird')) {
      Get.to(() => DetailScreen(
            picker: 2,
          ));
    } else {
      Fluttertoast.showToast(
          msg: "Otelde barınabilecek bir hayvan bulunamadı!");
    }
  }

  @override
  void onClose() {
    imageLabeler.close();
    super.onClose();
  }

  Future<void> launchableUrls(String link) async {
    final Uri url = Uri.parse(link);
    if (!await launchUrl(url)) {
      throw 'Could not load the page'.tr;
    }
  }
}
