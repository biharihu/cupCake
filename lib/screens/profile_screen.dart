import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import './personal_information.dart';
import './payments_&_payouts.dart';
import './notifications_screen.dart';

import '../providers/logic.dart';

import './inbox_screen.dart';
import './invite_friends_screen.dart';
import './new_home_screen.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = '/profilePage';

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final logicComp = Provider.of<Logic>(context, listen: false);

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

    return Scaffold(
      bottomNavigationBar: logicComp.allBottom(),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              top: 40.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5.0),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        color: Colors.transparent,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: Image.asset(
                          "images/photo.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 10.0),
                          child: FittedBox(
                            child: Text(
                              "Client/Artisan Name",
                              style: TextStyle(
                                letterSpacing: 2.0,
                                fontSize: 30.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10.0),
                          child: Text(
                            "View Profile",
                            style: TextStyle(
                              color: Colors.blue[400],
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(thickness: 2.0),
                Container(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  margin: EdgeInsets.only(top: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      sectionTitile("ACCOUNT SETTINGS"),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(PersonalInformation.routeName);
                        },
                        child: textWithIcon(
                            "Personal Information", "navIcon/person.png"),
                      ),
                      Divider(thickness: 1.0),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(PaymentsAndPayouts.routeName);
                        },
                        child: textWithIcon(
                            "Payments & Payouts", "navIcon/Card.png"),
                      ),
                      Divider(thickness: 1.0),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(NotificationsScreen.routeName);
                        },
                        child: textWithIcon(
                            "Notifications", "navIcon/Notification.png"),
                      ),
                      Divider(thickness: 1.0),
                      SizedBox(height: 5),
                      logicComp.bottom == false
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                sectionTitile("ARTISAN"),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      logicComp.bottom = true;
                                    });
                                    logicComp.write();
                                    // _write();
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pushReplacementNamed(
                                        InboxScreen.routeName);
                                  },
                                  child: textWithIcon(
                                      "Switch to artisan", "navIcon/Plus.png"),
                                ),
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                sectionTitile("CLIENT"),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      logicComp.bottom = false;
                                    });
                                    logicComp.write();
                                    // _write();
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pushReplacementNamed(
                                        NewHomePage.routeName);
                                  },
                                  child: textWithIcon(
                                      "Switch to client", "navIcon/Plus.png"),
                                ),
                              ],
                            ),

                      Divider(thickness: 1.0),
                      // textWithIcon("How to List", "navIcon/list.png"),
                      // Divider(thickness: 1.0),
                      // textWithIcon(
                      //     "Share your experience", "navIcon/Share.png"),
                      // Divider(thickness: 1.0),
                      SizedBox(height: 5),
                      sectionTitile("REFERRALS & CREDITS"),
                      InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(InviteFriendsScreen.routeName);
                          },
                          child: textWithIcon(
                              "Invite friends", "navIcon/Share.png")),
                      Divider(thickness: 1.0),
                      textWithIcon("Refer an artisan ", "navIcon/Money.png"),
                      Divider(thickness: 1.0),
                      SizedBox(height: 5),
                      sectionTitile("SUPPORT"),
                      textWithIcon("Get help", "navIcon/Information.png"),
                      Divider(thickness: 1.0),
                      textWithIcon("Give us feedback", "navIcon/mail.png"),
                      Divider(thickness: 1.0),
                      SizedBox(height: 5),
                      sectionTitile("LEGAL"),
                      textWithIcon("Terms of Services", "navIcon/paper.png"),
                      Divider(thickness: 1.0),
                      Container(
                        margin: EdgeInsets.only(left: 10.0),
                        child: Text(
                          "Logout",
                          style: TextStyle(
                            color: Colors.blue[400],
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget sectionTitile(String title) {
    return Text(
      title,
      style: TextStyle(
          letterSpacing: 0.5,
          fontSize: 15.0,
          color: Colors.grey,
          fontWeight: FontWeight.w600),
    );
  }
}
