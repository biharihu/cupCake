import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class FourthInput with ChangeNotifier {
  final String id;
  final List<Asset> assetImages;

  FourthInput({
    @required this.id,
    @required this.assetImages,
  });
}
