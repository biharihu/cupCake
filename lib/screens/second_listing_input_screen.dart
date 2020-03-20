import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/secondinput.dart';
import '../providers/seconInputProvider.dart';

class SecondListingInputScreen extends StatefulWidget {
  static const routeName = '/secondlistinginputscreen';

  @override
  _SecondListingInputScreenState createState() =>
      _SecondListingInputScreenState();
}

class _SecondListingInputScreenState extends State<SecondListingInputScreen> {
  final _form = GlobalKey<FormState>();
  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final routeId = ModalRoute.of(context).settings.arguments as String;

    var _enteredText = SecondInput(
      id: routeId,
      counteryRegion: '',
      street: '',
      flatHouseEtc: '',
      city: '',
      state: '',
      postCode: '',
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
        await Provider.of<SecondInputProvider>(context)
            .addProduct(_enteredText);
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
              "Where you are located?",
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
                      hintText: "e.g. India",
                      labelText: "Country/Region",
                      labelStyle: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    cursorColor: Colors.redAccent,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please provide your countery/region';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _enteredText = SecondInput(
                        id: _enteredText.id,
                        counteryRegion: value,
                        street: _enteredText.street,
                        flatHouseEtc: _enteredText.flatHouseEtc,
                        city: _enteredText.city,
                        state: _enteredText.state,
                        postCode: _enteredText.postCode,
                      );
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "e.g. A-402 Astik Apartment",
                      labelText: "Street",
                      labelStyle: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    cursorColor: Colors.redAccent,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please provide your street';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _enteredText = SecondInput(
                        id: _enteredText.id,
                        counteryRegion: _enteredText.counteryRegion,
                        street: value,
                        flatHouseEtc: _enteredText.flatHouseEtc,
                        city: _enteredText.city,
                        state: _enteredText.state,
                        postCode: _enteredText.postCode,
                      );
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "e.g. Flat No. 402, House No. 330",
                      labelText: "Flat, house, etc.",
                      labelStyle: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    cursorColor: Colors.redAccent,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please provide your flat, house, etc.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _enteredText = SecondInput(
                        id: _enteredText.id,
                        counteryRegion: _enteredText.counteryRegion,
                        street: _enteredText.street,
                        flatHouseEtc: value,
                        city: _enteredText.city,
                        state: _enteredText.state,
                        postCode: _enteredText.postCode,
                      );
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "e.g. Delhi",
                      labelText: "City",
                      labelStyle: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    cursorColor: Colors.redAccent,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please provide your city.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _enteredText = SecondInput(
                        id: _enteredText.id,
                        counteryRegion: _enteredText.counteryRegion,
                        street: _enteredText.street,
                        flatHouseEtc: _enteredText.flatHouseEtc,
                        city: value,
                        state: _enteredText.state,
                        postCode: _enteredText.postCode,
                      );
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "e.g. Delhi",
                      labelText: "State",
                      labelStyle: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    cursorColor: Colors.redAccent,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please provide your state';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _enteredText = SecondInput(
                        id: _enteredText.id,
                        counteryRegion: _enteredText.counteryRegion,
                        street: _enteredText.street,
                        flatHouseEtc: _enteredText.flatHouseEtc,
                        city: _enteredText.city,
                        state: value,
                        postCode: _enteredText.postCode,
                      );
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "e.g. 801503",
                      labelText: "Postcode",
                      labelStyle: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    cursorColor: Colors.redAccent,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please provide your postcode';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _enteredText = SecondInput(
                        id: _enteredText.id,
                        counteryRegion: _enteredText.counteryRegion,
                        street: _enteredText.street,
                        flatHouseEtc: _enteredText.flatHouseEtc,
                        city: _enteredText.city,
                        state: _enteredText.state,
                        postCode: value,
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
                .pushNamed('/thirdlistinginputscreen', arguments: routeId);
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
