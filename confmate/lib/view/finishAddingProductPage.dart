import 'dart:io';

import 'package:confmate/controller/FirestoreController.dart';
import 'package:confmate/model/Product.dart';
import 'package:confmate/model/Talk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// ignore: camel_case_types
class finishAddingProductPage extends StatefulWidget {
  final FirestoreController _firestore;
  String name;
  String description;
  String audience;
  File file;

  finishAddingProductPage(
      this._firestore, this.name, this.description, this.audience, this.file);

  @override
  _finishAddingProductPageState createState() => _finishAddingProductPageState(
      this._firestore, this.name, this.description, this.audience, this.file);
}

// ignore: camel_case_types
class _finishAddingProductPageState extends State<finishAddingProductPage> {
  bool showLoadingIndicator = true;
  final FirestoreController _firestore;
  String name;
  String description;
  String audience;
  List<Talk> _mytalks = new List();
  Product newProduct;
  List<Product> _myproducts = new List();
  List<Product> _mytempproducts = new List();
  File file;
  String fileName;

  _finishAddingProductPageState(
      this._firestore, this.name, this.description, this.audience, this.file);

  @override
  void initState() {
    super.initState();
    this.refreshModel(true);
  }

  Future<void> refreshModel(bool showIndicator) async {
    Stopwatch sw = Stopwatch()..start();

    _mytalks.clear();
    _mytalks = await widget._firestore.getMyTalks();
    _mytempproducts.clear();
    _mytempproducts = await widget._firestore.getProducts();

    if (_myproducts.length != 0) {
      for (Product p in _myproducts) {
        if (!_myproducts.contains(p)) newProduct = p;
      }
    }

    _myproducts.clear();
    _myproducts = _mytempproducts;

    fileName = "products/" + (_myproducts.length + 1).toString();

    setState(() {
      this.showLoadingIndicator = false;
    });

    print("Talks fetch time: " + sw.elapsed.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      appBar: buildAppBar(),
      body: this.showLoadingIndicator
          ? SpinKitRing(
              color: Colors.blue,
            )
          : buildBody(context),
    );
  }

  buildBody(context) => Body(context);

  AppBar buildAppBar() => AppBar(
      title: Text("Add New Product"),
      backgroundColor: Colors.blue[700],
      elevation: 0);

  // ignore: non_constant_identifier_names
  Body(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return showLoadingIndicator
        ? SpinKitRing(
            color: Colors.white,
          )
        : Column(children: <Widget>[
            Text(
              "To which talk would you like to add this product to?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'varela',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Container(
                padding: EdgeInsets.only(left: 10),
                width: size.width - 50,
                height: size.height - 200,
                child: ListView(scrollDirection: Axis.vertical, children: [
                  for (Talk x in _mytalks) _talkCard(x),
                ]))
          ]);
  }

  _talkCard(Talk talk) {
    return Column(
      children: <Widget>[
        Stack(children: [
          Container(
            height: 140.0,
          ),
          Positioned(
              child: Container(
            height: 125.0,
            width: 325.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.blue[200]),
          )),
          Positioned(
              top: 15.0,
              left: 20.0,
              child: Text(
                talk.name,
                style: TextStyle(
                    fontFamily: 'varela',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
          Positioned(
              left: 20.0,
              top: 50.0,
              child: talk.host.photo == "assets/profilepic.jpg"
                  ? Container(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        child: Image.asset("assets/profilepic.jpg",
                            width: 60, height: 60, fit: BoxFit.contain),
                      ),
                    )
                  : FutureBuilder(
                      future: this._firestore.getImgURL(talk.host.photo),
                      builder: (context, url) {
                        if (url.hasData) {
                          return Container(
                              height: 60.0,
                              width: 60.0,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1.5, color: Colors.blue[700]),
                                  borderRadius: BorderRadius.circular(200.0),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(url.data))));
                        } else {
                          return SizedBox(child: CircularProgressIndicator());
                        }
                      },
                    )),
          Positioned(
              left: 95.0,
              top: 55.5,
              child: Text(
                talk.host.firstname + ' ' + talk.host.lastname,
                style: TextStyle(
                    fontFamily: 'nunito',
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
          Positioned(
              left: 95.0,
              top: 80.0,
              child: Text(
                talk.host.job,
                style: TextStyle(
                    fontFamily: 'nunito',
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
          Positioned(
              right: 30.0,
              bottom: 47.5,
              child: IconButton(
                key: Key("SelectConference"),
                onPressed: () async {
                  this.file != null
                      ? this._firestore.addProduct(
                          talk,
                          this.name,
                          this.description,
                          this.audience,
                          "products/" +
                              talk.reference.id.toString() +
                              this._myproducts.length.toString())
                      : this._firestore.addProduct(talk, this.name,
                          this.description, this.audience, "assets/bag.png");
                  this.file != null
                      ? this._firestore.uploadImage(
                          this.file,
                          "products/" +
                              talk.reference.id.toString() +
                              this._myproducts.length.toString())
                      : print("no picture!");
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 45,
                  color: Colors.white,
                ),
              )),
        ]),
      ],
    );
  }
}
