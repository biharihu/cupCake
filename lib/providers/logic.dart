import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/bottomNavigationBar.dart';
import '../widgets/bottomNavigationBarA.dart';

class Logic with ChangeNotifier {
  bool bottom = false;

  Future<void> read() async {
    final prefs = await SharedPreferences.getInstance();
    final bottomBool = 'bottom_bool';
    final value = prefs.getBool(bottomBool) ?? false;
    bottom = value;
    notifyListeners();
  }

  Future<void> write() async {
    final prefs = await SharedPreferences.getInstance();
    final bottomBool = 'bottom_bool';
    final value = bottom;
    prefs.setBool(bottomBool, value);
  }

  Widget allBottom() {
    read();

    if (bottom == true) {
      return BottomBarA();
    } else if (bottom == false) {
      return BottomBar();
    }
    return null;
  }
}
