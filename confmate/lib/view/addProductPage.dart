import 'dart:io';

import 'package:confmate/controller/FirestoreController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:confmate/view/SignInPage.dart';
import 'package:confmate/view/finishAddingProductPage.dart';
import 'package:image_picker/image_picker.dart';

// ignore: camel_case_types
class addProductPage extends StatefulWidget {
  final FirestoreController _firestore;

  addProductPage(this._firestore);

  @override
  _addProductPageState createState() => _addProductPageState(this._firestore);
}

// ignore: camel_case_types
class _addProductPageState extends State<addProductPage> {
  bool showLoadingIndicator = true;
  final FirestoreController _firestore;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController audienceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  File _image;

  _addProductPageState(this._firestore);

  @override
  void initState() {
    super.initState();
    this.refreshModel(true);
  }

  Future<void> refreshModel(bool showIndicator) async {
    Stopwatch sw = Stopwatch()..start();

    setState(() {
      this.showLoadingIndicator = false;
    });

    print("addProduct fetch time: " + sw.elapsed.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue[700],
      appBar: buildAppBar(),
      body: buildBody(context),
    );
  }

  buildBody(context) => Body(context);

  AppBar buildAppBar() => AppBar(
      title: Text("Add A Product"),
      backgroundColor: Colors.blue[700],
      elevation: 0);

  Future chooseFile() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image = image;
      });
    });
  }

  // ignore: non_constant_identifier_names
  Body(BuildContext context) {
    return showLoadingIndicator
        ? SpinKitRing(
            color: Colors.white,
          )
        : Column(children: <Widget>[
            _buildNameTF(),
            SizedBox(height: 15.0),
            _buildAudienceTF(),
            SizedBox(height: 15.0),
            _buildDescriptionTF(),
            SizedBox(height: 25.0),
            RaisedButton(
              elevation: 5.0,
              onPressed: chooseFile,
              padding: EdgeInsets.all(15.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              color: Colors.white,
              child: _image == null
                  ? Text("ADD IMAGE")
                  : Text(
                      'IMAGE ADDED!',
                    ),
            ),
            SizedBox(height: 50.0),
            _buildLoginBtn(context),
          ]);
  }

  _buildNameTF() {
    return Container(
        key: Key("ProductName"),
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Name',
              style: kLabelStyle,
            ),
            SizedBox(height: 10.0),
            Container(
              alignment: Alignment.centerLeft,
              decoration: kBoxDecorationStyle,
              height: 60.0,
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                controller: nameController,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  prefixIcon: Icon(
                    Icons.people,
                    color: Colors.white,
                  ),
                  hintText: 'Insert New Name',
                  hintStyle: kHintTextStyle,
                ),
              ),
            ),
          ],
        ));
  }

  _buildAudienceTF() {
    return Container(
        key: Key("TargetAudience"),
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Target Audience',
              style: kLabelStyle,
            ),
            SizedBox(height: 10.0),
            Container(
              alignment: Alignment.centerLeft,
              decoration: kBoxDecorationStyle,
              height: 60.0,
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                controller: audienceController,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  prefixIcon: Icon(
                    Icons.people,
                    color: Colors.white,
                  ),
                  hintText: 'Specify Target Audience',
                  hintStyle: kHintTextStyle,
                ),
              ),
            ),
          ],
        ));
  }

  _buildDescriptionTF() {
    return Container(
        key: Key("ProductDescription"),
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Description',
              style: kLabelStyle,
            ),
            SizedBox(height: 10.0),
            Container(
              alignment: Alignment.centerLeft,
              decoration: kBoxDecorationStyle,
              height: 100.0,
              child: TextField(
                maxLines: null,
                keyboardType: TextInputType.multiline,
                controller: descriptionController,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  prefixIcon: Icon(
                    Icons.people,
                    color: Colors.white,
                  ),
                  hintText: 'Insert New Description',
                  hintStyle: kHintTextStyle,
                ),
              ),
            ),
          ],
        ));
  }

  Widget _buildLoginBtn(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      width: double.infinity,
      child: RaisedButton(
        key: Key("NextProductPage"),
        elevation: 5.0,
        onPressed: () {
          print(this._image);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => finishAddingProductPage(
                      this._firestore,
                      this.nameController.text.trim(),
                      this.descriptionController.text.trim(),
                      this.audienceController.text.trim(),
                      this._image)));
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'NEXT',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }
}
