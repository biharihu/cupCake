import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/logic.dart';

class PersonalInformation extends StatefulWidget {
  static const routeName = '/personal-information';

  @override
  _PersonalInformationState createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  final _personalInfo = GlobalKey<FormState>();
  int _genderValue;
  // String _initialValue = "";

  final _firstNameController = TextEditingController();
  final _genderController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _genderController.dispose();
    super.dispose();
  }

 

  @override
  Widget build(BuildContext context) {
    final logicComp = Provider.of<Logic>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: <Widget>[
          InkWell(
            onTap: () {
              
            },
            child: Container(
              padding: EdgeInsets.only(right: 20.0, top: 20.0),
              child: Text(
                "Save",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 18.0,
                    letterSpacing: 1),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: logicComp.allBottom(),
      body: ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 40.0, bottom: 15.0),
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Text(
              "Edit personal info",
              style: TextStyle(
                  fontSize: 35.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Form(
                key: _personalInfo,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    textFildTitle("First name"),
                    TextFormField(
                      controller: _firstNameController,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please provide Your Name';
                        }
                        return null;
                      },
                      // onSaved: (value) {},
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            print("Clear Button is taped");
                          },
                          child: Padding(
                            padding: EdgeInsetsDirectional.only(
                                end: 14.0,
                                top: 14.0,
                                bottom: 14.0,
                                start: 14.0),
                            child: textFildSuffixIcon("navIcon/Close.png"),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    textFildTitle("Last name"),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please provide Your Last Name';
                        }
                        return null;
                      },
                      onSaved: (value) {},
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            print("Clear Button is taped");
                          },
                          child: Padding(
                            padding: EdgeInsetsDirectional.only(
                                end: 14.0,
                                top: 14.0,
                                bottom: 14.0,
                                start: 14.0),
                            child: textFildSuffixIcon("navIcon/Close.png"),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    textFildTitle("Gender"),
                    TextFormField(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                  title: Text("Gender"),
                                  content: Container(
                                    height: 150,
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Radio(
                                              value: 1,
                                              groupValue: _genderValue,
                                              onChanged: (int e) {
                                                setState(() {
                                                  _genderValue = e;
                                                });

                                                Navigator.of(context).pop();
                                              },
                                            ),
                                            Text("Male"),
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Radio(
                                              value: 2,
                                              groupValue: _genderValue,
                                              onChanged: (int e) {
                                                setState(() {
                                                  _genderValue = e;
                                                });

                                                Navigator.of(context).pop();
                                              },
                                            ),
                                            Text("Female"),
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Radio(
                                              value: 3,
                                              groupValue: _genderValue,
                                              onChanged: (int e) {
                                                setState(() {
                                                  _genderValue = e;
                                                });

                                                Navigator.of(context).pop();
                                              },
                                            ),
                                            Text("Others"),
                                          ],
                                        )
                                      ],
                                    ),
                                  ));
                            });
                      },
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please provide Your Gender';
                        }
                        return null;
                      },
                      onSaved: (value) {},
                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                          onTap: () {
                            print("Clear Button is taped");
                          },
                          child: Padding(
                            padding: EdgeInsetsDirectional.only(
                                end: 14.0,
                                top: 14.0,
                                bottom: 14.0,
                                start: 14.0),
                            child: textFildSuffixIcon("navIcon/Close.png"),
                          ),
                        ),
                      ),
                      initialValue: _genderValue == 1
                          ? "Male"
                          : _genderValue == 2 ? "Female" : "Others",
                    ),
                    SizedBox(height: 20.0),
                    textFildTitle("Birth date"),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please provide Your DOB';
                        }
                        return null;
                      },
                      onSaved: (value) {},
                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                          onTap: () {
                            print("Clear Button is taped");
                          },
                          child: Padding(
                            padding: EdgeInsetsDirectional.only(
                                end: 14.0,
                                top: 14.0,
                                bottom: 14.0,
                                start: 14.0),
                            child: textFildSuffixIcon("navIcon/Close.png"),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    textFildTitle("Email"),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please provide Your Name';
                        }
                        return null;
                      },
                      onSaved: (value) {},
                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                          onTap: () {
                            print("Clear Button is taped");
                          },
                          child: Padding(
                            padding: EdgeInsetsDirectional.only(
                                end: 14.0,
                                top: 14.0,
                                bottom: 14.0,
                                start: 14.0),
                            child: textFildSuffixIcon("navIcon/Close.png"),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    textFildTitle("Phone number"),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please provide Your Name';
                        }
                        return null;
                      },
                      onSaved: (value) {},
                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                          onTap: () {
                            print("Clear Button is taped");
                          },
                          child: Padding(
                            padding: EdgeInsetsDirectional.only(
                                end: 14.0,
                                top: 14.0,
                                bottom: 14.0,
                                start: 14.0),
                            child: textFildSuffixIcon("navIcon/Close.png"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  // void genderSelected() {
  //   if (_genderValue == 1) {
  //     "Male";
  //   } else if (_genderValue == 2) {
  //     return "Female";
  //   } else if (_genderValue == 3) {
  //     return "Others";
  //   }
  //   return null;
  // }

  Widget textFildSuffixIcon(String imageS) {
    return Image.asset(
      imageS,
      fit: BoxFit.fill,
      height: 10.0,
      width: 10.0,
    );
  }

  Widget textFildTitle(String fildTitle) {
    return Container(
      child: Text(
        fildTitle,
        style: TextStyle(fontSize: 15.0),
      ),
    );
  }
}
