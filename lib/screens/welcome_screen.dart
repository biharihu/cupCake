import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/new_home_screen.dart';
import '../providers/logic.dart';

class WelcomeScreen extends StatelessWidget {
  final wlcmSubOrTitle = Container(
    margin: EdgeInsets.only(
      top: 150.0,
      left: 20,
    ),
    height: 130,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Welcome to',
          style: TextStyle(
            letterSpacing: 0.5,
            fontSize: 58,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          'RURAL HANDMADE',
          style: TextStyle(
            letterSpacing: 0.5,
            fontSize: 40,
            fontWeight: FontWeight.w700,
            color: Color.fromRGBO(220, 37, 73, 1),
          ),
        ),
      ],
    ),
  );
  final destText = Container(
    margin: EdgeInsets.only(left: 20),
    height: 70,
    child: Text(
      'Your one-stop furniture\ndestination.',
      style: TextStyle(
        letterSpacing: 0.5,
        fontSize: 18,
        fontWeight: FontWeight.w300,
        color: Colors.grey,
      ),
    ),
  );
  final image = Flexible(
      child: Container(
    height: 430,
    width: double.infinity,
    // margin: EdgeInsets.only(left: 20),
    // padding: EdgeInsets.only(left: 10, right: 40),
    child: Image.asset(
      'images/wlcm2.png',
    ),
  ));

  @override
  Widget build(BuildContext context) {
    final logic = Provider.of<Logic>(context);
    final button = Center(
      child: GestureDetector(
        onTap: () {
          logic.read();
          Navigator.of(context).pushReplacementNamed(NewHomePage.routeName);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color.fromRGBO(220, 37, 73, 1),
          ),
          height: 50,
          width: 350,
          child: Center(
            child: Text(
              'Get Started',
              textAlign: TextAlign.center,
              style: TextStyle(
                letterSpacing: 1.0,
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                wlcmSubOrTitle,
                destText,
                image,
              ],
            )),
            button,
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
