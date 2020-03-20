import 'package:flutter/material.dart';

import './secondinput.dart';

class SecondInputProvider with ChangeNotifier {
  List<SecondInput> _inputs = [];

  List<SecondInput> get input {
    return [..._inputs];
  }

  Future<void> addProduct(SecondInput product) async {
    final newProduct = SecondInput(
      counteryRegion: product.counteryRegion,
      street: product.street,
      flatHouseEtc: product.flatHouseEtc,
      city: product.city,
      state: product.state,
      postCode: product.postCode,
      id: product.id,
    );
    _inputs.add(newProduct);
    notifyListeners();
  }

  SecondInput findbyName(String id) {
    return _inputs.firstWhere((prod) => prod.id == id);
  }
}
