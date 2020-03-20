import 'package:flutter/material.dart';

import '../widgets/bottom.dart';

class PaymentsAndPayouts extends StatelessWidget {
  static const routeName = '/paymentsAndPayout';

  Widget textWithIcon(String titile, String imageN) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
              child: Text(
            titile,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
          )),
          Container(
            height: 35,
            width: 35,
            child: Image.asset(imageN),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      bottomNavigationBar: Bottom(),
      body: ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 20.0, bottom: 10.0),
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Text(
              "Payments and payouts",
              style: TextStyle(
                  fontSize: 30.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  textWithIcon("Payout preferences", "navIcon/Wallet.png"),
                  Divider(thickness: 2.0),
                  textWithIcon("Credits & coupons ", "navIcon/Card.png"),
                  Divider(thickness: 2.0),
                  textWithIcon("Currency", "navIcon/Money.png"),
                ],
              )),
        ],
      ),
    );
  }
}
