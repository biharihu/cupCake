import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:provider/provider.dart';

import '../providers/fourthInput.dart';
import '../providers/fourthInputProvider.dart';

class FourthListingInputScreen extends StatefulWidget {
  static const routeName = '/fourthlistinginputscreen';

  @override
  _FourthListingInputScreenState createState() =>
      _FourthListingInputScreenState();
}

class _FourthListingInputScreenState extends State<FourthListingInputScreen> {
  List<Asset> images = List<Asset>();
  Widget buildGridView() {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 10.0,
        crossAxisCount: 2,
      ),
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 400,
          height: 500,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeId = ModalRoute.of(context).settings.arguments as String;
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
      // FourthInput(
      //   assetImages: images,
      //   id: routeId,
      // );
      // print(images.toString());
    }

    var _enteredText = FourthInput(
      id: routeId,
      assetImages: images,
    );

    Future<void> _saveform() async {
      try {
        await Provider.of<FourthInputProvider>(context)
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
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.redAccent,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: loadAssets,
                child: Container(
                  child: Center(
                    child: Text(
                      "Select Images",
                      style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 2.0,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              width: 1.0,
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  _saveform();
                  Navigator.of(context)
                      .pushReplacementNamed('/listscreen', arguments: routeId);
                },
                child: Container(
                  child: Center(
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 2.0,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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
              "Upload images of your product",
              style: TextStyle(
                  fontSize: 30.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 700,
            child: buildGridView(),
          ),
        ],
      ),
    );
  }
}
