import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/logic.dart';
import '../widgets/bottom.dart';

class OrderScreen extends StatefulWidget {
  static const routename = '/order-screen';

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    final logic = Provider.of<Logic>(context, listen: false);

    Widget orderCard(
      BuildContext context,
      String imageName,
      String date,
      String status,
      String artName,
      String clntName,
    ) {
      return Container(
        height: 200,
        padding: const EdgeInsets.only(
            top: 5.0, left: 10.0, right: 10.0, bottom: 5.0),
        width: MediaQuery.of(context).size.width,
        child: Card(
          elevation: 5.0,
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                    child: Image.asset(
                  imageName,
                  fit: BoxFit.fill,
                )),
              ),
              Expanded(
                // flex: 1,
                child: Column(
                  children: <Widget>[
                    logic.bottom == false
                        ? Expanded(
                            flex: 1,
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "Artisan:",
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(artName),
                                ],
                              ),
                            ),
                          )
                        : Expanded(
                            flex: 1,
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "Order By:",
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(clntName),
                                ],
                              ),
                            ),
                          ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Order Date:",
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                            ),
                            Text(date),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Order Status:",
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                            ),
                            Text(status),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      bottomNavigationBar: Bottom(),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Orders",
                    style: TextStyle(
                        fontSize: 30.0,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            orderCard(
              context,
              "product/nest_of_tables.jpg",
              "02/10/2019",
              "Delivered",
              "Sushil Choudhary",
              "Vivek Singh",
            ),
            orderCard(
              context,
              "product/bookshelf11.jpg",
              "10/10/2019",
              "Delivered",
              "Vivek Singh",
              "Sushil Choudhary",
            ),
          ],
        ),
      ),
    );
  }
}
