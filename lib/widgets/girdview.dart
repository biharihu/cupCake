import 'package:cupcake/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';

class GridVieww extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);

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
                      product.imageName,
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
              padding: EdgeInsets.only(top: 5.0, left: 5.0),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(product.title,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold)),
                  Text(
                    '₹${product.price}',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        product.initalRating.toString(),
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
                          initialRating: product.initalRating,
                          fillColor: Colors.redAccent,
                          borderColor: Colors.redAccent,
                          allowHalfRating: true,
                          onRatingUpdate: (rating) {},
                        ),
                      ),
                      Text(
                        product.ratingCount,
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
