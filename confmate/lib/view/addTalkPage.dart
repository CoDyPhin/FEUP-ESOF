import 'package:confmate/controller/FirestoreController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:confmate/view/SignInPage.dart';

// ignore: camel_case_types
class addTalkPage extends StatefulWidget {
  final FirestoreController _firestore;

  addTalkPage(this._firestore);

  @override
  _addTalkPageState createState() => _addTalkPageState(this._firestore);
}

// ignore: camel_case_types
class _addTalkPageState extends State<addTalkPage> {
  bool showLoadingIndicator = true;
  final FirestoreController _firestore;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  _addTalkPageState(this._firestore);

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

    print("addTalk fetch time: " + sw.elapsed.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      appBar: buildAppBar(),
      body: buildBody(context),
    );
  }

  buildBody(context) => Body(context);

  AppBar buildAppBar() => AppBar(
      title: Text("Create New Talk"),
      backgroundColor: Colors.blue[700],
      elevation: 0);

  // ignore: non_constant_identifier_names
  Body(BuildContext context) {
    return showLoadingIndicator
        ? SpinKitRing(
            color: Colors.white,
          )
        : Column(children: <Widget>[
            _buildNameTF(),
            SizedBox(height: 15.0),
            _buildDescriptionTF(),
            SizedBox(height: 50.0),
            _buildLoginBtn(context),
          ]);
  }

  _buildNameTF() {
    return Container(
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

  _buildDescriptionTF() {
    return Container(
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
              height: 200.0,
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
        elevation: 5.0,
        onPressed: () {
          this._firestore.addTalk(
              nameController.text.trim(), descriptionController.text.trim());
          Navigator.pop(context, false);
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'CREATE',
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
