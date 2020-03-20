import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String imageName;
  final String title;
  final String price;
  final double initalRating;
  final String ratingCount;
  final String id;
  final String productDetail;
  final List<AssetImage> listImage;
  bool isSved;

  Product({
    @required this.imageName,
    @required this.title,
    @required this.price,
    @required this.initalRating,
    @required this.ratingCount,
    @required this.id,
    @required this.productDetail,
    @required this.listImage,
    this.isSved = false,
  });

  void toggleSaved() {
    isSved = !isSved;
    notifyListeners();
  }
}
