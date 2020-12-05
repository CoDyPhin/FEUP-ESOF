import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:confmate/pages/talksPage.dart';
import 'package:flutter/material.dart';

import '../FirestoreController.dart';
import '../Product.dart';
import '../Profile.dart';
import '../Talk.dart';
import '../pages/productsPage.dart';

class HomePage extends StatefulWidget {
  final FirestoreController _firestore;

  HomePage(this._firestore);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Talk> _talks = new List();
  List<Product> _products = new List();
  bool showLoadingIndicator = false;
  ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    this.refreshModel(true);
  }

  Future<void> refreshModel(bool showIndicator) async {
    Stopwatch sw = Stopwatch()..start();
    setState(() {
      showLoadingIndicator = showIndicator;
    });
    _talks = await widget._firestore.getTalks();
    _products = await widget._firestore.getProducts();
    print(_products.length);
    if (this.mounted)
      setState(() {
        showLoadingIndicator = false;
      });
    print("Talks fetch time: " + sw.elapsed.toString());
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(padding: EdgeInsets.only(left: 15.0), children: <Widget>[
          SizedBox(height: 50.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Welcome, Wissam',
                  style: TextStyle(
                      fontFamily: 'varela',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF473D3A))),
              Padding(
                padding: EdgeInsets.only(right: 30, top: 20),
                child: Container(
                  height: 75.0,
                  width: 75.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      image: DecorationImage(
                          image: AssetImage('assets/wissam.jpg'),
                          fit: BoxFit.cover)),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 100.0),
            child: Container(
              child: Text(
                'Let\'s select the best talk for you!',
                style: TextStyle(
                    fontFamily: 'nunito',
                    fontSize: 17.0,
                    fontWeight: FontWeight.w300,
                    color: Color(0xFFB0AAA7)),
              ),
            ),
          ),
          SizedBox(height: 25.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Featured Talks',
                style: TextStyle(
                    fontFamily: 'varela',
                    fontSize: 17.0,
                    color: Color(0xFF473D3A)),
              ),
            ],
          ),
          Container(
              height: 350.0,
              child: ListView(scrollDirection: Axis.horizontal, children: [
                for (Talk x in _talks) _talkListCard(x),
              ])),
          SizedBox(height: 25.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Featured Talks',
                style: TextStyle(
                    fontFamily: 'varela',
                    fontSize: 17.0,
                    color: Color(0xFF473D3A)),
              ),
            ],
          ),
          SizedBox(height: 15.0),
          Container(
              height: 350.0,
              child: ListView(scrollDirection: Axis.horizontal, children: [
                for (Product x in _products) _productListCard(x),
              ])),
        ]));
  }

  Widget _talkListCard(Talk talk) {
    return Padding(
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
        child: Container(
            height: 100.0,
            width: 225.0,
            child: Column(
              children: <Widget>[
                Stack(children: [
                  Container(height: 335.0),
                  Positioned(
                      top: 75.0,
                      child: Container(
                          padding: EdgeInsets.only(left: 10.0, right: 20.0),
                          height: 260.0,
                          width: 225.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              color: Colors.blue[200]),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 50.0,
                                ),
                                Text(
                                  talk.host.name,
                                  style: TextStyle(
                                      fontFamily: 'nunito',
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                SizedBox(height: 5.0),
                                Text(
                                  talk.name,
                                  style: TextStyle(
                                      fontFamily: 'varela',
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ]))),
                  Positioned(
                      right: 5.0,
                      bottom: 10.0,
                      child: FlatButton.icon(
                        textColor: Color(0xFF6200EE),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => talkDescription(talk)));
                        },
                        icon: Icon(Icons.arrow_forward_ios, size: 18),
                        label: Text("MORE DETAILS"),
                      )),
                  Positioned(
                      left: 70.0,
                      top: 25.0,
                      child: Container(
                          height: 90.0,
                          width: 90.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200.0),
                              image: DecorationImage(
                                  image: AssetImage(talk.host.photo),
                                  fit: BoxFit.cover))))
                ]),
              ],
            )));
  }

  _productListCard(Product product) {
    print(product.audience);
    return Padding(
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
        child: Container(
            height: 300.0,
            width: 225.0,
            child: Column(
              children: <Widget>[
                Stack(children: [
                  Container(height: 335.0),
                  Positioned(
                      top: 75.0,
                      child: Container(
                          padding: EdgeInsets.only(left: 10.0, right: 20.0),
                          height: 260.0,
                          width: 225.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              color: Colors.blue[200]),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 50.0,
                                ),
                                Text(
                                  product.audience,
                                  style: TextStyle(
                                      fontFamily: 'nunito',
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                SizedBox(height: 5.0),
                                Text(
                                  product.name,
                                  style: TextStyle(
                                      fontFamily: 'varela',
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ]))),
                  Positioned(
                      right: 5.0,
                      bottom: 10.0,
                      child: FlatButton.icon(
                        textColor: Color(0xFF6200EE),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      productDescription(product)));
                        },
                        icon: Icon(Icons.arrow_forward_ios, size: 18),
                        label: Text("MORE DETAILS"),
                      )),
                  Positioned(
                      left: 70.0,
                      top: 25.0,
                      child: Container(
                          height: 90.0,
                          width: 90.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200.0),
                              image: DecorationImage(
                                  image: AssetImage("assets/paysafe.jpg"),
                                  fit: BoxFit.cover))))
                ]),
              ],
            )));
  }
}
