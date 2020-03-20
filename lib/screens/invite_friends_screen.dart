import 'package:flutter/material.dart';

import '../widgets/bottom.dart';

// import 'package:provider/provider.dart';

// import '../providers/logic.dart';

class InviteFriendsScreen extends StatelessWidget {
  static const routeName = '/invite-friends-screen';

  Widget textWith(String titile) {
    return Container(
      child: Text(
        titile,
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final logicComp = Provider.of<Logic>(context, listen: false);
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
                  "Share your love of art",
                  style: TextStyle(
                      fontSize: 30.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "When your friend completes a art listing, you'll get up to Rs. 100 art credit.\n\nFriends who sign up for app with your link will get Rs.1000 off their first order. And they get Rs. 500 to use towards his first order.",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  color: Colors.blueAccent,
                  height: 40,
                  width: 120,
                  child: Center(
                    child: Text("Share your link",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                textWith("Your art credit"),
                Divider(thickness: 1.0),
                textWith("Read terms and conditions"),
                Divider(thickness: 1.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
