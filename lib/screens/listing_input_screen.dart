import 'package:flutter/material.dart';

class ListingInput extends StatelessWidget {
  static const routeName = '/listingInputScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        left: false,
        right: false,
        child: ListView(
          children: <Widget>[
            Container(
              height: 110,
              width: MediaQuery.of(context).size.width,
              color: Colors.redAccent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.arrow_back,
                      size: 30.0,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15.0, top: 20.0),
                    child: Text(
                      "Let's set up your listing",
                      style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "Art Details",
                          style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.w600),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed('/firstlistinginputscreen');
                        },
                        child: Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(color: Colors.redAccent),
                          child: Center(
                              child: Text(
                            "Continue",
                            style: TextStyle(
                                letterSpacing: 1.0,
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600),
                          )),
                        ),
                      ),
                    ],
                  ),
                  Divider(thickness: 2.0, height: 30.0),
                  listText("Location"),
                  Divider(thickness: 2.0, height: 30.0),
                  listText("Photos"),
                  Divider(thickness: 2.0, height: 30.0),
                  listText("Title"),
                  Divider(thickness: 2.0, height: 30.0),
                  listText("Order settings"),
                  Divider(thickness: 2.0, height: 30.0),
                  listText("Availability"),
                  Divider(thickness: 2.0, height: 30.0),
                  listText("Pricing"),
                  Divider(thickness: 2.0, height: 30.0),
                  listText("Review"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget listText(String data) {
    return Text(
      data,
      style: TextStyle(
          color: Colors.grey, fontSize: 22.0, fontWeight: FontWeight.w500),
    );
  }
}
