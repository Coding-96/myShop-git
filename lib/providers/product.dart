import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String Description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product(
      {required this.id,
      required this.title,
      required this.Description,
      required this.price,
      required this.imageUrl,
      this.isFavorite = false});

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
