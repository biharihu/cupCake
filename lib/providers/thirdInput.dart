import 'package:flutter/material.dart';

class ThirdInput with ChangeNotifier {
  final String id;
  final String productname;
  final String price;
  final String productDiscription;
  final String materialUsed;
  final String featured;

  ThirdInput({
    @required this.id,
    @required this.productname,
    @required this.price,
    @required this.productDiscription,
    @required this.materialUsed,
    @required this.featured,
  });
}
