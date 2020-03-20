import 'package:flutter/material.dart';

import './thirdInput.dart';

class ThirdInputProvider with ChangeNotifier {
  List<ThirdInput> _inputs = [];

  List<ThirdInput> get input {
    return [..._inputs];
  }

  Future<void> addProduct(ThirdInput product) async {
    final newProduct = ThirdInput(
      featured: product.featured,
      productname: product.productname,
      price: product.price,
      productDiscription: product.productDiscription,
      materialUsed: product.materialUsed,
      id: product.id,
    );
    _inputs.add(newProduct);
    notifyListeners();
  }

  ThirdInput findbyName(String id) {
    return _inputs.firstWhere((prod) => prod.id == id);
  }
}
