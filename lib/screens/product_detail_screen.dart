import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/product_detail.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail-scren';
  @override
  Widget build(BuildContext context) {
    Color textColor = Colors.white;
    Color backGroudcolor = Colors.black;
    final anId = ModalRoute.of(context).settings.arguments as String;
    final finalLodedData =
        Provider.of<ProductDetail>(context, listen: false).findbyId(anId);
    return Scaffold(
      backgroundColor: backGroudcolor,
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        height: 70,
        color: backGroudcolor,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                '₹${finalLodedData.price}',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0),
              ),
            ),
            Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.redAccent,
              ),
              child: Center(
                child: Text(
                  "Place Order",
                  style: TextStyle(
                    letterSpacing: 1.0,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
              // margin: EdgeInsets.only(
              //   top: 10.0,
              //   left: 10,
              // ),
              child: SizedBox(
            height: 550.0,
            width: double.infinity,
            child: Carousel(
              animationDuration: const Duration(milliseconds: 900),
              animationCurve: Curves.fastOutSlowIn,
              images: finalLodedData.listImage,
              dotSize: 8.0,
              dotSpacing: 15.0,
              dotColor: Colors.white,
              indicatorBgPadding: 5.0,
              dotBgColor: Colors.transparent.withOpacity(0),
              borderRadius: true,
              moveIndicatorFromBottom: 180.0,
              noRadiusForIndicator: true,
            ),
          )),
          Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 5.0, // has the effect of softening the shadow
                  spreadRadius: 5.0, // has the effect of extending the shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Tables",
                  style: TextStyle(
                      color: textColor,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5.0),
                Text(
                  finalLodedData.title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0),
                ),
                Text(
                  '₹${finalLodedData.price}',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0),
                ),
                SizedBox(height: 5.0),
                Text(
                  "Made in India",
                  style: TextStyle(
                      color: textColor,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "★★★★★",
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 16.0,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 5.0),
          Divider(
              thickness: 1.0, color: textColor, indent: 20.0, endIndent: 20.0),
          SizedBox(height: 5.0),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Product Description:",
                  style: TextStyle(
                      color: textColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  finalLodedData.productDetail,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: textColor,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                      wordSpacing: 1.0),
                ),
                SizedBox(height: 10.0),
                Text(
                  "Material",
                  style: TextStyle(
                      color: textColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  "This set of stool carries natural Honey finish which makes it more shiny and glossy and gives it a smooth soft touch. Use them for sitting or for keeping your decoration item at your house or office. ",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: textColor,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                      wordSpacing: 1.0),
                ),
                SizedBox(height: 10.0),
                Text(
                  "Featured",
                  style: TextStyle(
                      color: textColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  """1. Santosha Decor - Since 1990 / Made in India Product /Pure Indian Sheesham Wood \n2. Fully Assemble - No Assembly Required / Color - Natural Honey Finish \n3. Large Table : 45 Cm(H) X 30 Cm(W) X 45 Cm(L) | Medium Table : 34 Cm(H) X 28 Cm(W) X 38 Cm(L) | Small Table : 23 Cm(H) X 23 Cm(W) X 31 Cm(L) \n4. Traditional Indian Table Set With A Nesting Design In Set Of 3. Ideal For Use As Bedside/Lamp/Side Tables/ Study Table / Seating Purpose , Handle Up to 100Kg Weight \n5. Hand Made by Skilled Craftsmen In India Using Quality Wood | Designed For Life Time
          """,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: textColor,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                      wordSpacing: 1.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
