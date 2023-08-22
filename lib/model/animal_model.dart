import 'dart:ui';

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

class ThreeDAnimal {
  final String threeDImagePath;

  ThreeDAnimal({
    required this.threeDImagePath,
  });
}