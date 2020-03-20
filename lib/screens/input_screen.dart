import 'dart:async';
import '../providers/input_provider.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import '../screens/detail_screen.dart';
import '../providers/input_fields.dart';
// import 'package:flutter/rendering.dart';

class InputScreen extends StatefulWidget {
  static const routeName = '/input-screen';

  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  List<Asset> images = List<Asset>();
  final _form = GlobalKey<FormState>();
  var _isLoading = false;

  Widget buildGridView() {
    return GridView.count(
      mainAxisSpacing: 2.0,
      crossAxisSpacing: 2.0,
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }

  Future<void> loadAssets() async {
    setState(() {
      images = List<Asset>();
    });
    List<Asset> resultList;

    resultList = await MultiImagePicker.pickImages(
      maxImages: 300,
    );
    setState(() {
      images = resultList;
    });
    print(images.toString());
  }

  @override
  Widget build(BuildContext context) {
    var _enteredText = InputFields(
      id: DateTime.now().toString(),
      artCategory: '',
      artType: '',
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

    final deviHeight = MediaQuery.of(context).size.height;
    final listTitle = ModalRoute.of(context).settings.arguments as String;

    final allform = Container(
      height: deviHeight / 2.5,
      padding: EdgeInsets.all(10),
      child: Form(
        key: _form,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            Text(
              'Enter Your Name',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextFormField(
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please provide Your Name';
                }
                return null;
              },
              onSaved: (value) {},
            ),
            SizedBox(height: 5),
            Text(
              'Enter Address',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextFormField(
              textInputAction: TextInputAction.next,
              maxLines: 3,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please Fill Your Address';
                }
                return null;
              },
              onSaved: (value) {},
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Fill Requriments',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextFormField(
              textInputAction: TextInputAction.next,
              maxLines: 4,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please Fill Your Requriments';
                }
                return null;
              },
              onSaved: (value) {},
            ),
          ],
        ),
      ),
    );

    final bottomButton = GestureDetector(
      onTap: () {
        _saveform();
        if (_isLoading == true) {
          // Navigator.of(context)
          //     .pushNamed(DetailScreen.routeName, arguments: _enteredText.id);
        }
      },
      child: Container(
        height: 50,
        width: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Color.fromRGBO(220, 37, 73, 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
                child: Text(
              'Place Order',
              style: TextStyle(
                letterSpacing: 1.0,
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            )),
          ],
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 3,
        backgroundColor: Colors.white,
        title: Text(
          listTitle,
        ),
      ),
      body: Container(
        height: deviHeight,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              allform,
              Container(
                height: 280,
                child: buildGridView(),
              ),
              FlatButton.icon(
                icon: Icon(Icons.image),
                label: Text("Upload Images"),
                onPressed: loadAssets,
              ),
              bottomButton,
            ],
          ),
        ),
      ),
    );
  }
}
