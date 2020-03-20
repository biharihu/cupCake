import 'package:cupcake/widgets/girdview.dart';
import 'package:flutter/material.dart';
import '../widgets/bottom.dart';
import 'package:provider/provider.dart';
import '../providers/categorie_detail.dart';
import '../widgets/wavy_header.dart';
import '../providers/product_detail.dart';

class NewHomePage extends StatelessWidget {
  static const routeName = '/new-home-page';

  Widget rowBuilder(String title, String image) {
    return Container(
      margin: EdgeInsets.only(left: 5.0, right: 5.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Card(
        color: Colors.black12,
        elevation: 2.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 100,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20.0, left: 10.0),
              child: Text(
                title,
                style: TextStyle(
                  letterSpacing: 0.5,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final logicComp = Provider.of<Logic>(context, listen: false);
    final cData = Provider.of<CategoriesDetail>(context);
    final pData = Provider.of<ProductDetail>(context);
    final productData = pData.list;
    final deviceHeight = MediaQuery.of(context).size.height;
    // print(deviceHeight.toString());
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: Bottom(),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              WavyHeader(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Container(
                    height: 50.0,
                    margin: const EdgeInsets.all(10.0),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFFFCFCFC).withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Text(
                          'Try "Modern Art"',
                          style: TextStyle(color: Color(0xFFFCFCFC)),
                        )),
                        IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {},
                          color: Color(0xFFFCFCFC),
                          iconSize: 30.0,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 30.0,
                  left: 10.0,
                ),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Rural Handmade",
                      style: TextStyle(
                          letterSpacing: 1.0,
                          fontSize: 25.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 20.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "What can we help you find?",
                style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            margin: const EdgeInsets.only(left: 15.0, right: 15.0),
            height: 180,
            width: double.infinity,
            child: ListView.builder(
              // padding: EdgeInsets.only(left: 20.0, right: 20.0),
              scrollDirection: Axis.horizontal,
              itemCount: cData.list.length,
              itemBuilder: (context, i) {
                return rowBuilder(cData.list[i].type, cData.list[i].typeImage);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 20.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Top-rated Arts",
                style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            // color: Colors.white,
            height: 410,
            width: double.infinity,
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                // mainAxisSpacing: 10.0,
                crossAxisSpacing: deviceHeight <= 690
                    ? 5.0
                    : deviceHeight <= 800 ? 10.0 : 20.0,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height /
                        (deviceHeight <= 690
                            ? 1.4
                            : deviceHeight <= 800 ? 1.6 : 1.90)),
              ),
              itemCount: productData.length,
              itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                value: productData[i],
                child: GridVieww(
                    // pData.list[i].imageName,
                    // pData.list[i].price,
                    // pData.list[i].title,
                    // pData.list[i].initalRating,
                    // pData.list[i].ratingCount,
                    // pData.list[i].id,
                    ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/seemorescreen');
            },
            child: Container(
              height: 45.0,
              margin: EdgeInsets.only(left: 40.0, right: 40.0),
              decoration: BoxDecoration(
                // color: Colors.white,
                border: Border.all(color: Colors.redAccent[400], width: 2.0),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Center(
                child: Text(
                  "Show more Arts",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
