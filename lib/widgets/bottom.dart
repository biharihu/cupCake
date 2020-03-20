import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/logic.dart';

import './bottomNavigationBar.dart';
import './bottomNavigationBarA.dart';

class Bottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logicComp = Provider.of<Logic>(context);
    return Container(
      child: logicComp.bottom == false ? BottomBar() : BottomBarA(),
    );
  }
}
