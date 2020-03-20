import 'package:flutter/material.dart';

class SecondInput with ChangeNotifier {
  final String id;
  final String counteryRegion;
  final String street;
  final String flatHouseEtc;
  final String city;
  final String state;
  final String postCode;

  SecondInput({
    @required this.id,
    @required this.counteryRegion,
    @required this.street,
    @required this.flatHouseEtc,
    @required this.city,
    @required this.state,
    @required this.postCode,
  });
}
