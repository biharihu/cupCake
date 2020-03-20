import 'package:flutter/material.dart';

import '../widgets/bottom.dart';

import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:provider/provider.dart';

import '../providers/logic.dart';

class InboxScreen extends StatelessWidget {
  static const routeName = '/inbox-screen';

  @override
  Widget build(BuildContext context) {
    final logicComp = Provider.of<Logic>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      bottomNavigationBar: Bottom(),
      body: ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Inbox",
                  style: TextStyle(
                      fontSize: 30.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.bold),
                ),
                logicComp.bottom == false
                    ? Text(
                        "Receive messages from artisan, including your orders requests",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      )
                    : Text(
                        "Receive messages from client and co-artisan",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                SizedBox(height: 20.0),
                SizedBox(
                  width: double.infinity,
                  child: TypewriterAnimatedTextKit(
                      onTap: () {
                        print("Tap Event");
                      },
                      text: ['Seems like there are no messages for you.'],
                      textStyle: TextStyle(fontSize: 25.0),
                      textAlign: TextAlign.start,
                      alignment:
                          AlignmentDirectional.topStart // or Alignment.topLeft
                      ),
                ),
                Image.asset("images/gif.gif"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
