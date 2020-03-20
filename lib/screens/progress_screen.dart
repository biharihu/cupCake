import 'package:flutter/material.dart';

import '../widgets/bottom.dart';

class ProgressScreen extends StatelessWidget {
  static const routeName = '/progress-screen';
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Progress",
                  style: TextStyle(
                      fontSize: 30.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),
                Text(
                  "₹000.00",
                  style: TextStyle(
                      fontSize: 30.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Anual earnings",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.0),
                ),
                SizedBox(height: 5.0),
                Text(
                  "View your transaction history",
                  style: TextStyle(
                    color: Colors.blue[400],
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Divider(thickness: 1.0),
                SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "0",
                          style: TextStyle(
                              fontSize: 30.0,
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "30-day views",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 15.0),
                        ),
                      ],
                    ),
                    SizedBox(width: 50.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "0",
                          style: TextStyle(
                              fontSize: 30.0,
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "30-day orders",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 15.0),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Divider(thickness: 1.0),
                Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "--★",
                          style: TextStyle(
                              fontSize: 30.0,
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Overall rating\n(shown after 3 reviews)",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 15.0),
                        ),
                      ],
                    ),
                    SizedBox(width: 50.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "0",
                          style: TextStyle(
                              fontSize: 30.0,
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "30-day orders",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 15.0),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Divider(thickness: 1.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
