import 'package:cupcake/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../providers/input_fields.dart';

class GridViewwTwo extends StatelessWidget {
  final String price;
  final String title;

  GridViewwTwo({@required this.price, @required this.title});
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<InputFields>(context);

    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ProductDetailScreen.routeName, arguments: product.id);
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
                      "product/nest_of_tables.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    color: Colors.red,
                    icon: Icon(product.isSved
                        ? Icons.favorite
                        : Icons.favorite_border),
                    onPressed: () {
                      product.toggleSaved();
                    },
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
                  Text(title,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold)),
                  Text(
                    '₹$price',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "4.5",
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 6.0, left: 2.0, right: 2.0),
                        child: FlutterRatingBar(
                          itemSize: 14.0,
                          initialRating: 4.5,
                          fillColor: Colors.redAccent,
                          borderColor: Colors.redAccent,
                          allowHalfRating: true,
                          onRatingUpdate: (rating) {},
                        ),
                      ),
                      Text(
                        "450",
                        style: TextStyle(
                            color: Colors.redAccent,
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
    );
  }
}
