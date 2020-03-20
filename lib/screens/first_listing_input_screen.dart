import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cupcake/providers/input_fields.dart';
import 'package:cupcake/providers/input_provider.dart';

class FirstListingInputScreen extends StatefulWidget {
  static const routeName = '/firstlistinginputscreen';

  @override
  _FirstListingInputScreenState createState() =>
      _FirstListingInputScreenState();
}

class _FirstListingInputScreenState extends State<FirstListingInputScreen> {
  final _form = GlobalKey<FormState>();
  var _isLoading = false;
  int _radioValue1 = 0;
  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;
    });
  }

  var _enteredText = InputFields(
    id: DateTime.now().toString(),
    artType: '',
    artCategory: '',
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
      await Provider.of<InputFieldItems>(context).addProduct(_enteredText);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
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
              "Tell us about your art",
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
                  textfieldTitle("First, tell us you're product type"),
                  TextFormField(
                    cursorColor: Colors.redAccent,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please provide Your product type';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _enteredText = InputFields(
                        id: _enteredText.id,
                        artType: value,
                        artCategory: _enteredText.artCategory,
                      );
                    },
                  ),
                  SizedBox(height: 10.0),
                  textfieldTitle("Now tell you're Art category"),
                  TextFormField(
                    cursorColor: Colors.redAccent,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please provide your art category';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _enteredText = InputFields(
                        id: _enteredText.id,
                        artType: _enteredText.artType,
                        artCategory: value,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "What will Client order?",
              style: TextStyle(
                  fontSize: 30.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: selectingTitle("Custom order"),
                    ),
                    Radio(
                      groupValue: _radioValue1,
                      activeColor: Colors.redAccent,
                      value: 1,
                      onChanged: _handleRadioValueChange1,
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: selectingTitle("Readymades order"),
                    ),
                    Radio(
                      groupValue: _radioValue1,
                      activeColor: Colors.redAccent,
                      value: 2,
                      onChanged: _handleRadioValueChange1,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          _saveform();
          if (_isLoading == true) {
            Navigator.of(context).pushNamed('/secondlistinginputscreen',
                arguments: _enteredText.id);
          }
        },
        child: Container(
          height: 50,
          // margin: const EdgeInsets.only(left: 250, right: 20.0, bottom: 10.0),
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

  Widget selectingTitle(String data) {
    return Text(
      data,
      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
    );
  }

  Widget textfieldTitle(String data) {
    return Text(
      data,
      style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w700),
    );
  }
}
