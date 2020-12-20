import 'package:confmate/controller/FirestoreController.dart';
import 'package:confmate/model/Comments.dart';
import 'package:confmate/model/Notification.dart';
import 'package:confmate/model/Profile.dart';
import 'package:confmate/model/Talk.dart';
import 'package:confmate/view/notificationsPage.dart';
import 'package:confmate/view/addProductPage.dart';
import 'package:confmate/view/profilePage.dart';
import 'package:flutter/material.dart';

import 'package:confmate/model/Product.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

List<Product> myProducts = [];

class ProductsPage extends StatefulWidget {
  final FirestoreController _firestore;

  ProductsPage(this._firestore);
  @override
  _ProductsPageState createState() => _ProductsPageState(this._firestore);
}

class _ProductsPageState extends State<ProductsPage>
    with SingleTickerProviderStateMixin {
  bool showLoadingIndicator = false;
  ScrollController scrollController;
  List<Product> _products = new List();
  List<Product> _productstemp = new List();
  List<Product> _featuredproducts = new List();
  List<Product> _myproducts = new List();
  List<Notifications> _notifications = new List();
  List<Talk> _mytalks = new List();
  Profile _profile;
  bool noNewNotifications = true;
  final FirestoreController _firestore;

  _ProductsPageState(this._firestore);

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
    _products.clear();
    _productstemp.clear();
    _featuredproducts.clear();
    _myproducts.clear();
    _notifications.clear();
    _mytalks.clear();
    _mytalks = await widget._firestore.getMyTalks();
    _productstemp = await widget._firestore.getProducts();
    _profile = widget._firestore.getCurrentUser();
    _notifications = await widget._firestore.getMyNotifications();

    for (Notifications n in _notifications) {
      if (!n.seen) noNewNotifications = false;
    }

    bool pass = true;
    for (var x = 0; x < _productstemp.length; x++) {
      for (var i = 0; i < _mytalks.length; i++) {
        if (_mytalks[i].reference == _productstemp[x].talk.reference) {
          pass = false;
        }
      }
      if (pass) {
        _products.add(_productstemp[x]);
      } else {
        _myproducts.add(_productstemp[x]);
      }
      pass = true;
    }

    if (_mytalks.isEmpty) _products = _productstemp;

    for (var x = 0; x < _products.length; x++) {
      if (_products[x].featured) _featuredproducts.add(_products[x]);
    }

    if (this.mounted)
      setState(() {
        showLoadingIndicator = false;
      });
    print("Products fetch time: " + sw.elapsed.toString());
  }

  Widget build(BuildContext context) {
    return showLoadingIndicator
        ? SpinKitRing(
            color: Colors.blue,
          )
        : _profile.isHost
            ? DefaultTabController(
                length: 3,
                child: Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                      title: Text("Products"),
                      actions: noNewNotifications
                          ? <Widget>[
                              IconButton(
                                icon: Icon(
                                  Icons.notifications,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    this.refreshModel(false);
                                  });
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              notificationsPage(
                                                  this._firestore)));
                                },
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    this.refreshModel(false);
                                  });
                                  Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  addProductPage(
                                                      this._firestore)))
                                      .then((value) => this.refreshModel(true));
                                },
                              )
                            ]
                          : <Widget>[
                              IconButton(
                                icon: Icon(
                                  Icons.notification_important,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    noNewNotifications = true;
                                    this.refreshModel(false);
                                  });
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              notificationsPage(
                                                  this._firestore)));
                                  this.refreshModel(false);
                                },
                              )
                            ],
                      bottom: TabBar(
                        tabs: <Widget>[
                          Tab(
                            text: 'Featured',
                          ),
                          Tab(
                            text: 'All',
                          ),
                          Tab(
                            text: 'My Products',
                          ),
                        ],
                      )),
                  body: TabBarView(
                    children: [
                      Container(
                          height: 500.0,
                          child: GridView.builder(
                            itemCount: _featuredproducts.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.75,
                            ),
                            itemBuilder: (context, index) =>
                                _productDisplay(_featuredproducts, index),
                          )),
                      Container(
                          height: 500.0,
                          child: GridView.builder(
                            itemCount: _products.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.75,
                            ),
                            itemBuilder: (context, index) =>
                                _productDisplay(_products, index),
                          )),
                      Container(
                          height: 500.0,
                          child: GridView.builder(
                            itemCount: _myproducts.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.75,
                            ),
                            itemBuilder: (context, index) =>
                                _checkWhoApplied(_myproducts, index),
                          )),
                    ],
                  ),
                ))
            : DefaultTabController(
                length: 2,
                child: Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    title: Text("Products"),
                    bottom: TabBar(
                      tabs: <Widget>[
                        Tab(
                          text: 'Featured',
                        ),
                        Tab(
                          text: 'All',
                        ),
                      ],
                    ),
                    actions: noNewNotifications
                        ? <Widget>[
                            IconButton(
                              icon: Icon(
                                Icons.notifications,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  noNewNotifications = true;
                                });
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => notificationsPage(
                                            this._firestore)));
                              },
                            )
                          ]
                        : <Widget>[
                            IconButton(
                              icon: Icon(
                                Icons.notification_important,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => notificationsPage(
                                            this._firestore)));
                              },
                            )
                          ],
                  ),
                  body: TabBarView(
                    children: [
                      Container(
                          height: 500.0,
                          child: GridView.builder(
                            itemCount: _featuredproducts.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.75,
                            ),
                            itemBuilder: (context, index) =>
                                _productDisplay(_featuredproducts, index),
                          )),
                      Container(
                          height: 500.0,
                          child: GridView.builder(
                            itemCount: _products.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.75,
                            ),
                            itemBuilder: (context, index) =>
                                _productDisplay(_products, index),
                          )),
                    ],
                  ),
                ));
  }

  _productDisplay(List<Product> list, int index) {
    return Container(
        child: Column(
      children: <Widget>[
        Stack(
          children: [
            Container(height: 230.0, width: 230.0),
            Positioned(
                top: 30.0,
                right: 18.5,
                child: Container(
                  height: 160.0,
                  width: 160.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.blue[200]),
                )),
            Positioned(
                right: 19.0,
                top: 50.0,
                child: new SizedBox(
                    width: 162.5,
                    child: FlatButton(
                        onPressed: () async {
                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => productDescription(
                                      list[index],
                                      this._profile,
                                      this._firestore)));
                        },
                        child: FutureBuilder(
                          future: this._firestore.getImgURL(list[index].image),
                          builder: (context, url) {
                            if (url.hasData) {
                              return Container(
                                  height: 125.0,
                                  width: 125.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(url.data))));
                            } else {
                              return SizedBox(
                                  child: CircularProgressIndicator());
                            }
                          },
                        )))),
            Positioned(
                left: 20.0,
                top: 195.0,
                child: Text(
                  list[index].name,
                  style: TextStyle(
                      fontFamily: 'nunito',
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )),
            Positioned(
                left: 20.0,
                top: 212,
                child: Text(
                  list[index].audience,
                  style: TextStyle(
                      fontFamily: 'nunito',
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38),
                )),
          ],
        ),
      ],
    ));
  }

  _checkWhoApplied(List<Product> list, int index) {
    return Container(
        child: Column(
      children: <Widget>[
        Stack(
          children: [
            Container(height: 230.0, width: 230.0),
            Positioned(
                top: 30.0,
                right: 18.5,
                child: Container(
                  height: 160.0,
                  width: 160.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.blue[200]),
                )),
            Positioned(
                right: 19.0,
                top: 50.0,
                child: new SizedBox(
                    width: 162.5,
                    child: FlatButton(
                        onPressed: () async {
                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => productWhoApplied(
                                      list[index], this._firestore)));
                        },
                        child: FutureBuilder(
                          future: this._firestore.getImgURL(list[index].image),
                          builder: (context, url) {
                            if (url.hasData) {
                              return Container(
                                  height: 125.0,
                                  width: 125.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(url.data))));
                            } else {
                              return SizedBox(
                                  child: CircularProgressIndicator());
                            }
                          },
                        )))),
            Positioned(
                left: 20.0,
                top: 195.0,
                child: Text(
                  list[index].name,
                  style: TextStyle(
                      fontFamily: 'nunito',
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )),
            Positioned(
                left: 20.0,
                top: 212,
                child: Text(
                  list[index].audience,
                  style: TextStyle(
                      fontFamily: 'nunito',
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38),
                )),
          ],
        ),
      ],
    ));
  }
}

// ignore: camel_case_types
class productWhoApplied extends StatefulWidget {
  Product product;
  final FirestoreController _firestore;

  productWhoApplied(this.product, this._firestore);

  @override
  _productWhoAppliedState createState() =>
      _productWhoAppliedState(this.product, this._firestore);
}

class _productWhoAppliedState extends State<productWhoApplied> {
  Product product;
  List<Profile> _candidates = new List(), _users = new List();
  List<Comments> _comments = new List();
  final FirestoreController _firestore;
  _productWhoAppliedState(this.product, this._firestore);
  bool showLoadingIndicator = true;

  @override
  void initState() {
    super.initState();
    this.refreshModel(true);
  }

  Future<void> refreshModel(bool showIndicator) async {
    _candidates.clear();
    _comments.clear();
    _users.clear();
    _comments = await widget._firestore.getCommentsForProduct(this.product);
    _users = await widget._firestore.getUsers();
    for (int x = 0; x < _comments.length; x++) {
      for (int i = 0; i < _users.length; i++) {
        if (_comments[x].attendee == _users[i].reference)
          _candidates.add(_users[i]);
      }
    }
    setState(() {
      this.showLoadingIndicator = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      appBar: AppBar(backgroundColor: Colors.blue[700], elevation: 0),
      body: buildBody(context),
    );
  }

  buildBody(context) => Body(context);

  AppBar buildAppBar() => AppBar(
        backgroundColor: Colors.blue[700],
        elevation: 0,
      );

  // ignore: non_constant_identifier_names
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
              child: FutureBuilder(
                future: this._firestore.getImgURL(product.image),
                builder: (context, url) {
                  if (url.hasData) {
                    return Container(
                        height: 200.0,
                        width: 200.0,
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 5, color: Colors.blue[700]),
                            borderRadius: BorderRadius.circular(20.0),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(url.data))));
                  } else {
                    return SizedBox(child: CircularProgressIndicator());
                  }
                },
              )),
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
              top: 300.0,
              child: Container(
                child: Text(
                  "Candidates",
                  style: TextStyle(
                      fontFamily: 'nunito',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38),
                ),
              )),
          Padding(
              padding: EdgeInsets.only(top: 350),
              child: Container(
                  height: 300.0,
                  child: showLoadingIndicator
                      ? SpinKitRing(
                          color: Colors.blue,
                        )
                      : (_candidates.isEmpty
                          ? Text(
                              "No Candidates Yet!",
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black38),
                            )
                          : ListView(
                              scrollDirection: Axis.vertical,
                              padding: EdgeInsets.only(left: 20.0, top: 10.0),
                              children: [
                                  for (Profile x in _candidates)
                                    _candidateCard(x),
                                ])))),
        ]),
      ]),
    );
  }

  _candidateCard(Profile profile) {
    return Padding(
        padding: EdgeInsets.only(right: 15.0),
        child: FlatButton(
            onPressed: () {
              giveawayProduct(context, profile);
              this.refreshModel(false);
            },
            child: Container(
                height: 150.0,
                width: 325.0,
                child: Column(
                  children: <Widget>[
                    Stack(children: [
                      Container(height: 150.0),
                      Positioned(
                          top: 0.0,
                          child: Container(
                            padding: EdgeInsets.only(left: 10.0, right: 0.0),
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
                            profile.firstname + " " + profile.lastname,
                            style: TextStyle(
                                fontFamily: 'varela',
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                      Positioned(
                          left: 20.0,
                          top: 50.0,
                          child: FutureBuilder(
                            future: this._firestore.getImgURL(profile.photo),
                            builder: (context, url) {
                              if (url.hasData) {
                                return Container(
                                    height: 60.0,
                                    width: 60.0,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1.5,
                                            color: Colors.blue[700]),
                                        borderRadius:
                                            BorderRadius.circular(200.0),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(url.data))));
                              } else {
                                return SizedBox(
                                    child: CircularProgressIndicator());
                              }
                            },
                          )),
                      Positioned(
                          left: 95.0,
                          top: 52.5,
                          child: Text(
                            profile.job,
                            style: TextStyle(
                                fontFamily: 'nunito',
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                      Positioned(
                          left: 95.0,
                          top: 75.0,
                          child: Text(
                            profile.area,
                            style: TextStyle(
                                fontFamily: 'nunito',
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                      Positioned(
                        right: 20.0,
                        bottom: 65.0,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 40,
                          color: Colors.blue,
                        ),
                      ),
                    ]),
                  ],
                ))));
  }

  giveawayProduct(BuildContext context, Profile profile) {
    Comments comment;
    for (int x = 0; x < this._comments.length; x++) {
      if (this._comments[x].attendee == profile.reference &&
          this._comments[x].product == product.reference) {
        comment = this._comments[x];
      }
    }

    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );
    Widget noButton = FlatButton(
      child: Text("No"),
      onPressed: () {
        for (int x = 0; x < this._comments.length; x++) {
          if (this._comments[x].attendee == profile.reference &&
              this._comments[x].product == product.reference) {
            comment.reference.delete();
            setState(() {
              this._firestore.addNotificationRejected(profile, product, false);
              this.refreshModel(false);
            });
          }
        }
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Yes"),
      onPressed: () {
        for (int x = 0; x < this._comments.length; x++) {
          if (this._comments[x].attendee == profile.reference &&
              this._comments[x].product == product.reference) {
            comment.reference.delete();
            setState(() {
              this._firestore.addNotificationAccepted(profile, product, false);
              this.refreshModel(false);
            });
          }
        }
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Warning"),
      content: Text("Do you wish to give this product to " +
          profile.firstname +
          " " +
          profile.lastname +
          "?\n\nText Submitted:\n\n" +
          comment.comment),
      actions: [
        cancelButton,
        noButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

// ignore: camel_case_types
class productDescription extends StatefulWidget {
  Product product;
  Profile _profile;
  final FirestoreController _firestore;

  productDescription(this.product, this._profile, this._firestore);

  @override
  _productDescriptionState createState() =>
      _productDescriptionState(this.product, this._profile, this._firestore);
}

class _productDescriptionState extends State<productDescription> {
  Product product;
  Profile _profile;
  List<Comments> _comments;
  final FirestoreController _firestore;
  bool appliedFor = false;

  _productDescriptionState(this.product, this._profile, this._firestore);

  @override
  void initState() {
    super.initState();
    this.refreshModel(true);
  }

  Future<void> refreshModel(bool showIndicator) async {
    _comments = await widget._firestore
        .getComments(this.product, this._firestore.getCurrentUser());
    setState(() {
      if (_comments.length == 0)
        this.appliedFor = false;
      else
        this.appliedFor = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      appBar: AppBar(backgroundColor: Colors.blue[700], elevation: 0),
      body: buildBody(context),
    );
  }

  buildBody(context) => Body(context);

  AppBar buildAppBar() => AppBar(
        backgroundColor: Colors.blue[700],
        elevation: 0,
      );

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
              child: FutureBuilder(
                future: this._firestore.getImgURL(product.image),
                builder: (context, url) {
                  if (url.hasData) {
                    return Container(
                        height: 200.0,
                        width: 200.0,
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 2.5, color: Colors.blue[700]),
                            borderRadius: BorderRadius.circular(20.0),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(url.data))));
                  } else {
                    return SizedBox(child: CircularProgressIndicator());
                  }
                },
              )),
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
              left: 5.0,
              top: 390.0,
              child: Container(
                  child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserPage(product.talk.host)));
                },
                child: Text(
                  product.talk.host.firstname +
                      ' ' +
                      product.talk.host.lastname,
                  style: TextStyle(
                      fontFamily: 'nunito',
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ))),
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
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        product.description,
                        style: TextStyle(
                            fontFamily: 'nunito',
                            fontSize: 15.0,
                            color: Colors.black),
                      ))
                ],
              )),
          Positioned(
            width: 300.0,
            height: 50.0,
            top: 600.0,
            child: RaisedButton(
                onPressed: () {
                  if (!this.appliedFor)
                    bookingUnbookingAlert(context);
                  else {
                    setState(() {
                      this._comments[0].reference.delete();
                      this.refreshModel(false);
                    });
                  }
                },
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0)),
                child: this.appliedFor
                    ? Text(
                        "Unapply For",
                        style: TextStyle(
                            fontFamily: 'nunito',
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        textAlign: TextAlign.center,
                      )
                    : Text(
                        "Apply For",
                        style: TextStyle(
                            fontFamily: 'nunito',
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        textAlign: TextAlign.center,
                      )),
          ),
        ]),
      ]),
    );
  }

  void bookingUnbookingAlert(BuildContext context) {
    final TextEditingController textController = TextEditingController();
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Continue"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop('dialog');
        setState(() {
          this._firestore.addComment(this._firestore.getCurrentUser(),
              textController.text.trim(), this.product);
          this.refreshModel(false);
        });
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Booking Seat"),
      content: TextField(
        autofocus: true,
        maxLines: 8,
        controller: textController,
        keyboardType: TextInputType.multiline,
        decoration: new InputDecoration(hintText: 'State your reasons here'),
      ),
      //Text("You're about to book a seat in this talk!"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
