import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cupcake/providers/thirdInput.dart';
import 'package:cupcake/providers/thirdInputProvider.dart';

class ThirdListingInputScreen extends StatefulWidget {
  static const routeName = '/thirdlistinginputscreen';

  @override
  _ThirdListingInputScreenState createState() =>
      _ThirdListingInputScreenState();
}

class _ThirdListingInputScreenState extends State<ThirdListingInputScreen> {
  final _form = GlobalKey<FormState>();
  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final routeId = ModalRoute.of(context).settings.arguments as String;
    var _enteredText = ThirdInput(
      id: routeId,
      productname: '',
      price: '',
      productDiscription: '',
      materialUsed: '',
      featured: '',
    );
    Future<void> _saveform() async {
      final isValue = _form.currentState.validate();
      if (!isValue) {
        return;
      }
      _form.currentState.save();
      setState(() {
        _isLoading = true;
      });

      try {
        await Provider.of<ThirdInputProvider>(context).addProduct(_enteredText);
      } catch (error) {
        await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('An error occurred'),
            content: Text('Something went wrong.'),
            actions: <Widget>[
              FlatButton(
                child: Text('Okey'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              )
            ],
          ),
        );
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
                Icons.arrow_back,
                size: 30.0,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "About your product?",
              style: TextStyle(
                  fontSize: 30.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _form,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      // alignLabelWithHint: true,
                      hintText: "e.g. Table",
                      labelText: "Product Name",
                      labelStyle: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    cursorColor: Colors.redAccent,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please provide your product name.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _enteredText = ThirdInput(
                        id: _enteredText.id,
                        productname: value,
                        price: _enteredText.price,
                        productDiscription: _enteredText.productDiscription,
                        materialUsed: _enteredText.materialUsed,
                        featured: _enteredText.featured,
                      );
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "e.g. 3,599",
                      labelText: "Price",
                      labelStyle: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    cursorColor: Colors.redAccent,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter the price';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _enteredText = ThirdInput(
                        id: _enteredText.id,
                        productname: _enteredText.productname,
                        price: value,
                        productDiscription: _enteredText.productDiscription,
                        materialUsed: _enteredText.materialUsed,
                        featured: _enteredText.featured,
                      );
                    },
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Product discription:",
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  TextFormField(
                    maxLines: 5,
                    cursorColor: Colors.redAccent,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please provide your product discription.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _enteredText = ThirdInput(
                        id: _enteredText.id,
                        productname: _enteredText.productname,
                        price: _enteredText.price,
                        productDiscription: value,
                        materialUsed: _enteredText.materialUsed,
                        featured: _enteredText.featured,
                      );
                    },
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Material used:",
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  TextFormField(
                    maxLines: 5,
                    cursorColor: Colors.redAccent,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please provide material detail';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _enteredText = ThirdInput(
                        id: _enteredText.id,
                        productname: _enteredText.productname,
                        price: _enteredText.price,
                        productDiscription: _enteredText.productDiscription,
                        materialUsed: value,
                        featured: _enteredText.featured,
                      );
                    },
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Featured",
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  TextFormField(
                    maxLines: 5,
                    cursorColor: Colors.redAccent,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please provide the featured';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _enteredText = ThirdInput(
                        id: _enteredText.id,
                        productname: _enteredText.productname,
                        price: _enteredText.price,
                        productDiscription: _enteredText.productDiscription,
                        materialUsed: _enteredText.materialUsed,
                        featured: value,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          _saveform();
          if (_isLoading == true) {
            Navigator.of(context)
                .pushNamed('/fourthlistinginputscreen', arguments: routeId);
          }
        },
        child: Container(
          height: 50,
          color: Colors.redAccent,
          child: Center(
            child: Text(
              "Next",
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.0,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
