import 'package:flutter/material.dart';

import '../screens/order_screen.dart';
import '../screens/saved_screen.dart';
import '../screens/inbox_screen.dart';
import '../screens/new_home_screen.dart';

class BottomBar extends StatelessWidget {
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
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(60.0), topRight: Radius.circular(60.0))),
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
                        .pushReplacementNamed(NewHomePage.routeName);
                  },
                  child: Container(
                    height: 35,
                    width: 35,
                    child: Image.asset(
                      "navIcon/search.png",
                      color: textColor,
                      // scale: 10.0,
                    ),
                  ),
                ),
              ),
              Text("EXPLORE",
                  style: TextStyle(
                    color: textColor,
                  )),
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
                    Navigator.of(context).pushNamed(SavedScreen.routeName);
                  },
                  child: Container(
                    height: 35,
                    width: 35,
                    child: Image.asset(
                      "navIcon/love.png",
                      color: textColor,
                    ),
                  ),
                ),
              ),
              Text("SAVED",
                  style: TextStyle(
                    color: textColor,
                  )),
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
                    Navigator.of(context).pushNamed(OrderScreen.routename);
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
              Text("ORDERS",
                  style: TextStyle(
                    color: textColor,
                  )),
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
                    Navigator.of(context).pushNamed(InboxScreen.routeName);
                  },
                  child: Container(
                    height: 35,
                    width: 35,
                    child: Image.asset(
                      "navIcon/mail.png",
                      color: textColor,
                    ),
                  ),
                ),
              ),
              Text("INBOX",
                  style: TextStyle(
                    color: textColor,
                  )),
            ],
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
                // redirect('/profilePage');
                // Navigator.of(context).pushNamed(ProfilePage.routeName);
              },
              child: Column(
                children: <Widget>[
                  Container(
                    height: 35,
                    width: 35,
                    child: Image.asset(
                      "navIcon/people.png",
                      color: textColor,
                    ),
                  ),
                  Text("PROFILE",
                      style: TextStyle(
                        color: textColor,
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
