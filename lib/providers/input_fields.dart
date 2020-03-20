import 'package:flutter/foundation.dart';

class InputFields with ChangeNotifier {
  final String id;
  final String artType;
  final String artCategory;
  bool isSved;

  InputFields({
    @required this.id,
    @required this.artType,
    @required this.artCategory,
    this.isSved = false,
  });

  void toggleSaved() {
    isSved = !isSved;
    notifyListeners();
  }
}
