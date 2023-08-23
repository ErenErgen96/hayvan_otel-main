import 'dart:io';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:hayvan_oteli/view/main_screens/detail_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:tflite/tflite.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeViewModel extends GetxController {
  final CarouselController carouselController = CarouselController();
  String currentTime = '';
  late ImagePicker imagePicker;
  File? image;
  String result = '';
  dynamic imageLabeler;
  String currentName = "Eren ERGEN";
  XFile? second_image;
  bool _loading = false;
  List<dynamic>? outputs;
  String predOne = '';
  double confidence = 0;
  double index = 0;

  final ImagePicker _picker = ImagePicker();
  void navigateToDetailScreen(int selectedPicker) {
    Get.to(() => DetailScreen(picker: selectedPicker));
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/aimodel/model_unquant.tflite",
      labels: 'assets/aimodel/labels.txt',
    );
  }

  classifyImage(image) async {
    var file = File(image.path);

    var output = await Tflite.runModelOnImage(
      path: file.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    outputs = output;
    print(outputs);
    // Sınıflandırma sonuçlarına göre detay sayfasına yönlendirme
    if (outputs != null && outputs!.isNotEmpty) {
      String topPrediction = outputs?[0]['label'];
      double confidence = outputs?[0]['confidence'];

      if (topPrediction == '1 Cat' && confidence >= 0.5) {
        navigateToDetailScreen(1); //kedi
      } else if (topPrediction == '0 Bird' && confidence >= 0.5) {
        navigateToDetailScreen(2); //kus
      } else if (topPrediction == '3 Dog' && confidence >= 0.5) {
        navigateToDetailScreen(0); //köpk
      } else if (topPrediction == '2 Horse' && confidence >= 0.5) {
        navigateToDetailScreen(3); //at
      } else {
        Fluttertoast.showToast(
            msg: "Otelde barınabilecek bir hayvan bulunamadı!");
      }
    } else {
      Fluttertoast.showToast(msg: "Sınıflandırma sonuçları alınamadı!");
    }
  }

  HomeViewModel() {
    final ImageLabelerOptions options =
        ImageLabelerOptions(confidenceThreshold: 0.5);
    imageLabeler = ImageLabeler(options: options);
    updateQRCode();
    loadModel();
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
    classifyImage(image);
    // doImageLabeling();
  }

  imgFromGallery() async {
    imagePicker = ImagePicker();
    XFile? pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    image = File(pickedFile!.path);

    classifyImage(image);
  }

  //fotoğraf etiketleme
  /* doImageLabeling() async {
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
*/
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
