import 'package:flutter/material.dart';
import '../widgets/bottom.dart';

class NotificationsScreen extends StatefulWidget {
  static const routeName = '/notificationScreen';

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool _email = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Notifications",
          style: TextStyle(
            fontSize: 20.0,
            letterSpacing: 1,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
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
                  "Messages",
                  style: TextStyle(
                      fontSize: 30.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Receive messages from customer and artisan, including orders requests",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              children: <Widget>[
                SwitchListTile(
                  activeColor: Colors.blue[400],
                  value: _email,
                  title: Text("Email"),
                  onChanged: (newValue) {
                    setState(() {
                      _email = newValue;
                    });
                  },
                ),
                Divider(thickness: 2.0),
                SwitchListTile(
                  activeColor: Colors.blue[400],
                  value: _email,
                  title: Text("Push notifications"),
                  subtitle: Text("To your mobile or tablet device"),
                  onChanged: (newValue) {
                    setState(() {
                      _email = newValue;
                    });
                  },
                ),
                Divider(thickness: 2.0),
                SwitchListTile(
                  activeColor: Colors.blue[400],
                  value: _email,
                  title: Text("Text messages"),
                  onChanged: (newValue) {
                    setState(() {
                      _email = newValue;
                    });
                  },
                ),
                Divider(thickness: 2.0),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.0, bottom: 10.0),
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Reminders",
                  style: TextStyle(
                      fontSize: 30.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Receive orders reminders, request to write a review, pricing notices, and other reminders related to your arts or application.",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              children: <Widget>[
                SwitchListTile(
                  activeColor: Colors.blue[400],
                  value: _email,
                  title: Text("Email"),
                  onChanged: (newValue) {
                    setState(() {
                      _email = newValue;
                    });
                  },
                ),
                Divider(thickness: 2.0),
                SwitchListTile(
                  activeColor: Colors.blue[400],
                  value: _email,
                  title: Text("Push notifications"),
                  subtitle: Text("To your mobile or tablet device"),
                  onChanged: (newValue) {
                    setState(() {
                      _email = newValue;
                    });
                  },
                ),
                Divider(thickness: 2.0),
                SwitchListTile(
                  activeColor: Colors.blue[400],
                  value: _email,
                  title: Text("Text messages"),
                  onChanged: (newValue) {
                    setState(() {
                      _email = newValue;
                    });
                  },
                ),
                Divider(thickness: 2.0),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.0, bottom: 10.0),
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Promotions and tips",
                  style: TextStyle(
                      fontSize: 30.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Receive coupons, promotions, surveys, product updates, and inspiration from app.",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              children: <Widget>[
                SwitchListTile(
                  activeColor: Colors.blue[400],
                  value: _email,
                  title: Text("Email"),
                  onChanged: (newValue) {
                    setState(() {
                      _email = newValue;
                    });
                  },
                ),
                Divider(thickness: 2.0),
                SwitchListTile(
                  activeColor: Colors.blue[400],
                  value: _email,
                  title: Text("Push notifications"),
                  subtitle: Text("To your mobile or tablet device"),
                  onChanged: (newValue) {
                    setState(() {
                      _email = newValue;
                    });
                  },
                ),
                Divider(thickness: 2.0),
                SwitchListTile(
                  activeColor: Colors.blue[400],
                  value: _email,
                  title: Text("Text messages"),
                  onChanged: (newValue) {
                    setState(() {
                      _email = newValue;
                    });
                  },
                ),
                Divider(thickness: 2.0),
                SwitchListTile(
                  activeColor: Colors.blue[400],
                  value: _email,
                  title: Text("Phone calls"),
                  onChanged: (newValue) {
                    setState(() {
                      _email = newValue;
                    });
                  },
                ),
                Divider(thickness: 2.0),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.0, bottom: 10.0),
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Policy and community",
                  style: TextStyle(
                      fontSize: 30.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Receive updates on home sharing regulations and saty infomed about advocacy efforts to create fair, responsible art sharing in your community.",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              children: <Widget>[
                SwitchListTile(
                  activeColor: Colors.blue[400],
                  value: _email,
                  title: Text("Email"),
                  onChanged: (newValue) {
                    setState(() {
                      _email = newValue;
                    });
                  },
                ),
                Divider(thickness: 2.0),
                SwitchListTile(
                  activeColor: Colors.blue[400],
                  value: _email,
                  title: Text("Push notifications"),
                  subtitle: Text("To your mobile or tablet device"),
                  onChanged: (newValue) {
                    setState(() {
                      _email = newValue;
                    });
                  },
                ),
                Divider(thickness: 2.0),
                SwitchListTile(
                  activeColor: Colors.blue[400],
                  value: _email,
                  title: Text("Text messages"),
                  onChanged: (newValue) {
                    setState(() {
                      _email = newValue;
                    });
                  },
                ),
                Divider(thickness: 2.0),
                SwitchListTile(
                  activeColor: Colors.blue[400],
                  value: _email,
                  title: Text("Phone calls"),
                  onChanged: (newValue) {
                    setState(() {
                      _email = newValue;
                    });
                  },
                ),
                Divider(thickness: 2.0),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.0, bottom: 10.0),
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Account support",
                  style: TextStyle(
                      fontSize: 30.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "We may need to send you messages regarding your account, your arts, legal notifications, security and privacy matters, and customer support requests. For your security you cannot disable email notifications and we may contact you by phone or other means if needed.",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              children: <Widget>[
                SwitchListTile(
                  activeColor: Colors.blue[400],
                  value: true,
                  title: Text("Email"),
                  onChanged: null,
                ),
                Divider(thickness: 2.0),
                SwitchListTile(
                  activeColor: Colors.blue[400],
                  value: _email,
                  title: Text("Push notifications"),
                  subtitle: Text("To your mobile or tablet device"),
                  onChanged: (newValue) {
                    setState(() {
                      _email = newValue;
                    });
                  },
                ),
                Divider(thickness: 2.0),
                SwitchListTile(
                  activeColor: Colors.blue[400],
                  value: _email,
                  title: Text("Text messages"),
                  onChanged: (newValue) {
                    setState(() {
                      _email = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
