import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../providers/product_detail.dart';
import '../screens/product_detail_screen.dart';
import '../widgets/bottom.dart';

class SavedScreen extends StatelessWidget {
  static const routeName = '/saved-screen';

  @override
  Widget build(BuildContext context) {
    final pData = Provider.of<ProductDetail>(context);
    // final logicComp = Provider.of<Logic>(context, listen: false);
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
            margin: const EdgeInsets.only(top: 20.0, bottom: 10.0),
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Saved",
                  style: TextStyle(
                      fontSize: 30.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Collect arts and things to do by tapping the heart icon.",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            color: Colors.white,
            height: 450,
            width: double.infinity,
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                // mainAxisSpacing: 10.0,
                crossAxisSpacing: 20.0,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.75),
              ),
              itemCount: 2,
              itemBuilder: (ctx, i) => GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                      arguments: pData.list[i].id);
                },
                child: Container(
                  decoration: BoxDecoration(
                    // color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2.0),
                              // color: Colors.green,
                            ),
                            height: 120,
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(2.0),
                              child: Image.asset(
                                pData.list[i].imageName,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              color: Colors.red,
                              icon: Icon(Icons.favorite),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.only(top: 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(pData.list[i].title,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold)),
                            Text(
                              '₹${pData.list[i].price}',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600),
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  pData.list[i].initalRating.toString(),
                                  style: TextStyle(
                                      color: Colors.lightBlueAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 6.0, left: 2.0, right: 2.0),
                                  child: FlutterRatingBar(
                                    itemSize: 14.0,
                                    initialRating: pData.list[i].initalRating,
                                    fillColor: Colors.lightBlueAccent,
                                    borderColor: Colors.lightBlueAccent,
                                    allowHalfRating: true,
                                    onRatingUpdate: (rating) {},
                                  ),
                                ),
                                Text(
                                  pData.list[i].ratingCount,
                                  style: TextStyle(
                                      color: Colors.lightBlueAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
