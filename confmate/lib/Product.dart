import 'package:confmate/Profile.dart';
import 'package:flutter/material.dart';

import 'Talk.dart';

class Product {
  String name;
  String description;
  String picture;
  String audience;
  Talk talk;
  int price, id;

  Product(this.name, this.id, this.description, this.price, this.picture,
      this.audience, this.talk);
}

class productDescription extends StatefulWidget {
  Product product;
  productDescription(this.product);

  @override
  _productDescriptionState createState() =>
      _productDescriptionState(this.product);
}

class _productDescriptionState extends State<productDescription> {
  Product product;
  List<Product> products;
  _productDescriptionState(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      appBar: buildAppBar(),
      body: buildBody(context),
    );
  }

  buildBody(context) => Body(context);

  AppBar buildAppBar() =>
      AppBar(backgroundColor: Colors.blue[700], elevation: 0);

  Body(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        Stack(alignment: Alignment.topCenter, children: <Widget>[
          Container(
              margin: EdgeInsets.only(top: size.height * 0.275),
              height: 475,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24)))),
          Positioned(
              right: 30.0,
              top: 70.0,
              child: Container(
                  height: 200.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                          alignment: Alignment.center,
                          image: AssetImage(this.product.picture),
                          fit: BoxFit.cover)))),
          Positioned(
              left: 20.0,
              top: 20.0,
              child: Container(
                child: Text(
                  this.product.name,
                  style: TextStyle(
                      fontFamily: 'nunito',
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              )),
          Positioned(
              left: 20.0,
              child: Container(
                child: Text(
                  this.product.audience,
                  style: TextStyle(
                      fontFamily: 'nunito',
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              )),
          Positioned(
              left: 20.0,
              top: 300.0,
              child: Container(
                child: Text(
                  "Talk",
                  style: TextStyle(
                      fontFamily: 'nunito',
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38),
                ),
              )),
          Positioned(
              left: 20.0,
              top: 320.0,
              child: Container(
                child: Text(
                  this.product.talk.name,
                  style: TextStyle(
                      fontFamily: 'nunito',
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              )),
          Positioned(
              left: 20.0,
              top: 370.0,
              child: Container(
                child: Text(
                  "Host",
                  style: TextStyle(
                      fontFamily: 'nunito',
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38),
                ),
              )),
          Positioned(
              left: 20.0,
              top: 390.0,
              child: Container(
                child: Text(
                  this.product.talk.host.name,
                  style: TextStyle(
                      fontFamily: 'nunito',
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              )),
          Positioned(
              left: 20.0,
              top: 440.0,
              child: Container(
                child: Text(
                  "Description",
                  style: TextStyle(
                      fontFamily: 'nunito',
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38),
                ),
              )),
          Positioned(
              top: 465.0,
              width: 350.0,
              child: Column(
                children: <Widget>[
                  Text(
                    product.description,
                    style: TextStyle(
                        fontFamily: 'nunito',
                        fontSize: 15.0,
                        color: Colors.black),
                  )
                ],
              )),
          Positioned(
              top: 170.0,
              left: 20.0,
              child: Column(
                children: <Widget>[
                  Text(
                    "Units: 10",
                    style: TextStyle(
                        fontFamily: 'nunito',
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
                ],
              )),
          Positioned(
            width: 300.0,
            height: 50.0,
            top: 600.0,
            child: RaisedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text("Do you wish to apply for this product?"),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () {
                                Navigator.pop(context, false);
                              },
                              child: Text("Yes"),
                            ),
                            FlatButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: Text("No"),
                            )
                          ],
                        ));
              },
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0)),
              child: new Text(
                "Apply For",
                style: TextStyle(
                    fontFamily: 'nunito',
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ]),
      ]),
    );
  }
}
