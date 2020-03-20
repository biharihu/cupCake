import 'package:flutter/material.dart';

class Categorie with ChangeNotifier {
  final String type;
  final String typeImage;

  Categorie({
    @required this.type,
    @required this.typeImage,
  });
}
