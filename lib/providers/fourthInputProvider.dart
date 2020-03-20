import 'package:flutter/material.dart';

import './fourthInput.dart';

class FourthInputProvider with ChangeNotifier {
  List<FourthInput> _inputs = [];

  List<FourthInput> get input {
    return [..._inputs];
  }

  Future<void> addProduct(FourthInput product) async {
    final newProduct = FourthInput(
      assetImages: product.assetImages,
      id: product.id,
    );
    _inputs.add(newProduct);
    notifyListeners();
  }

  FourthInput findbyName(String id) {
    return _inputs.firstWhere((prod) => prod.id == id);
  }
}
