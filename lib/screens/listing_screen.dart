import 'package:flutter/material.dart';
import '../widgets/bottom.dart';
import './listing_input_screen.dart';
import 'package:provider/provider.dart';
import '../providers/thirdInputProvider.dart';

// import '../providers/logic.dart';
// import '../providers/seconInputProvider.dart';
// import '../providers/input_provider.dart';
// import '../providers/fourthInputProvider.dart';

class ListingScreen extends StatelessWidget {
  static const routeName = '/listscreen';

  @override
  Widget build(BuildContext context) {
    // final logicComp = Provider.of<Logic>(context);
    // final firstinputedData =
    //     Provider.of<InputFieldItems>(context, listen: false);
    // final secondinputedData =
    //     Provider.of<SecondInputProvider>(context, listen: false);
    // final fourthinputedData =
    //     Provider.of<FourthInputProvider>(context, listen: false);
    final thirdinputedData = Provider.of<ThirdInputProvider>(context);

    return Scaffold(
      bottomNavigationBar: Bottom(),
      body: SafeArea(
        bottom: false,
        right: false,
        left: false,
        child: ListView(
          children: <Widget>[
            Align(
              child: IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context).pushNamed(ListingInput.routeName);
                },
              ),
              alignment: Alignment.topRight,
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Listings",
                    style: TextStyle(
                        fontSize: 30.0,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              height: 180,
              width: double.infinity,
              child: Card(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 15.0, top: 10.0, right: 10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                "Your Art",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Container(
                              height: 80,
                              width: 80,
                              color: Colors.grey[300],
                              child: Icon(
                                Icons.camera_alt,
                                size: 30.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 15.0, bottom: 10.0, right: 10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(height: 5.0),
                                  Text(
                                    "Finish your listing",
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "You're 3% of the way there.",
                                  ),
                                  SizedBox(height: 10.0),
                                  Container(
                                    margin: const EdgeInsets.only(right: 20.0),
                                    width: double.infinity,
                                    height: 4.0,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 300),
                                      decoration: BoxDecoration(
                                        color: Colors.redAccent,
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Icons.arrow_forward_ios,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                elevation: 5.0,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(ListingInput.routeName);
              },
              child: Container(
                margin: const EdgeInsets.only(top: 20.0),
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                height: 60.0,
                width: double.infinity,
                child: Card(
                  elevation: 5.0,
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 10.0),
                      Icon(
                        Icons.add,
                        color: Colors.redAccent,
                        size: 30.0,
                      ),
                      SizedBox(width: 15.0),
                      Text(
                        "List another art",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              height: 60.0,
              width: double.infinity,
              child: Text(
                "Listed Arts",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              height: 500,
              child: ListView.builder(
                itemCount: thirdinputedData.input.length,
                itemBuilder: (context, i) {
                  return thirdinputedData.input[i].productname == null
                      ? Container()
                      : Container(
                          margin: const EdgeInsets.only(top: 20.0),
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          height: 60,
                          width: double.infinity,
                          child: Card(
                            elevation: 5.0,
                            child: Row(
                              children: <Widget>[
                                SizedBox(width: 15.0),
                                Text(
                                  "${i + 1}.",
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(width: 10.0),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    thirdinputedData.input[i].productname,
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                // Text(firstinputedData.input[i].artType),
                                // Text(firstinputedData.input[i].artCategory),
                                // Text(secondinputedData.input[i].counteryRegion),
                                // Text(secondinputedData.input[i].street),
                                // Text(secondinputedData.input[i].flatHouseEtc),
                                // Text(secondinputedData.input[i].city),
                                // Text(secondinputedData.input[i].state),
                                // Text(secondinputedData.input[i].postCode),
                                // Text(thirdinputedData.input[i].productname),
                                // Text(thirdinputedData.input[i].price),
                                // Text(thirdinputedData.input[i].productDiscription),
                                // Text(thirdinputedData.input[i].materialUsed),
                                // Text(thirdinputedData.input[i].featured),
                              ],
                            ),
                          ),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
