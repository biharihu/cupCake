import 'package:cupcake/widgets/girdview_two.dart';
import 'package:flutter/material.dart';
// import '../widgets/bottom.dart';
import 'package:provider/provider.dart';
// import '../providers/input_fields.dart';
import '../providers/input_provider.dart';
import '../providers/thirdInputProvider.dart';

class SeeMoreScreen extends StatelessWidget {
  static const routeName = '/seemorescreen';

  @override
  Widget build(BuildContext context) {
    final thirdInput = Provider.of<ThirdInputProvider>(context);
    final pData = Provider.of<InputFieldItems>(context);
    final productData = pData.input;
    final deviceHeight = MediaQuery.of(context).size.height;
    // final product = Provider.of<InputFields>(context);

    return Scaffold(
      // bottomNavigationBar: Bottom(),
      body: ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 20.0, bottom: 10.0),
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Latest Arts",
                  style: TextStyle(
                      fontSize: 30.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            color: Colors.white,
            height: deviceHeight,
            width: double.infinity,
            child: GridView.builder(
              scrollDirection: Axis.vertical,
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
                // productData[i] == null ? null :
                child: thirdInput.input[i].productname == null
                    ? Container()
                    : GridViewwTwo(
                        title: thirdInput.input[i].productname,
                        price: thirdInput.input[i].price,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
