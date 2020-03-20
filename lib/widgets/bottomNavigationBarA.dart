import 'package:flutter/material.dart';

import '../screens/order_screen.dart';
import '../screens/inbox_screen.dart';
import '../screens/progress_screen.dart';
import '../screens/listing_screen.dart';

class BottomBarA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color textColor = Colors.redAccent[400];
    final newRouteName = "/profilePage";
    bool isNewRouteSameAsCurrent = false;
    // void redirect(screen) {
    //   Navigator.popUntil(context, (route) {
    //     if (route.settings.name != screen) {
    //       Navigator.pushNamed(context, screen);
    //     }
    //     return true;
    //   });
    // }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey,
        //     blurRadius: 20.0, // has the effect of softening the shadow
        //     spreadRadius: 4.0, // has the effect of extending the shadow
        //     offset: Offset(
        //       10.0, // horizontal, move right 10
        //       20.0, // vertical, move down 10
        //     ),
        //   ),
        // ],
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60.0), topRight: Radius.circular(60.0)),
      ),
      padding: EdgeInsets.only(top: 5.0),
      height: 60,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.amberAccent,
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(InboxScreen.routeName);
                  },
                  child: Container(
                    height: 35,
                    width: 35,
                    child: Image.asset("navIcon/Chat.png", color: textColor),
                  ),
                ),
              ),
              Text(
                "INBOX",
                style: TextStyle(color: textColor),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.amberAccent,
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(OrderScreen.routename);
                  },
                  child: Container(
                    height: 35,
                    width: 35,
                    child: Image.asset(
                      "navIcon/paper.png",
                      color: textColor,
                    ),
                  ),
                ),
              ),
              Text(
                "ORDERS",
                style: TextStyle(color: textColor),
              ),
            ],
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(ListingScreen.routeName);
              },
              child: Column(
                children: <Widget>[
                  Container(
                    height: 35,
                    width: 35,
                    child: Image.asset("navIcon/list.png", color: textColor),
                  ),
                  Text(
                    "LIST ART",
                    style: TextStyle(color: textColor),
                  ),
                ],
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(ProgressScreen.routeName);
              },
              child: Column(
                children: <Widget>[
                  Container(
                    height: 35,
                    width: 35,
                    child: Image.asset("navIcon/mail.png", color: textColor),
                  ),
                  Text(
                    "PROGRESS",
                    style: TextStyle(color: textColor),
                  ),
                ],
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.amberAccent,
              borderRadius: BorderRadius.circular(50),
              onTap: () {
                Navigator.popUntil(context, (route) {
                  if (route.settings.name == newRouteName) {
                    isNewRouteSameAsCurrent = true;
                  }
                  return true;
                });

                if (!isNewRouteSameAsCurrent) {
                  Navigator.pushNamed(context, newRouteName);
                }
              },
              child: Column(
                children: <Widget>[
                  Container(
                    height: 35,
                    width: 35,
                    child: Image.asset("navIcon/person.png", color: textColor),
                  ),
                  Text(
                    "PROFILE",
                    style: TextStyle(color: textColor),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
