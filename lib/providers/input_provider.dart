import 'package:flutter/material.dart';

import '../providers/input_fields.dart';

class InputFieldItems with ChangeNotifier {
  List<InputFields> _inputs = [];

  List<InputFields> get input {
    return [..._inputs];
  }

  Future<void> addProduct(InputFields product) async {
    final newProduct = InputFields(
      artType: product.artType,
      artCategory: product.artCategory,
      id: product.id,
      isSved: product.isSved,
    );
    _inputs.add(newProduct);
    notifyListeners();
  }

  InputFields findbyName(String id) {
    return _inputs.firstWhere((prod) => prod.id == id);
  }
}
