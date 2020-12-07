import 'package:confmate/controller/FirestoreController.dart';
import 'package:confmate/model/Comments.dart';
import 'package:confmate/model/Profile.dart';
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
  TabController _tabController;
  bool showLoadingIndicator = false;
  ScrollController scrollController;
  List<Product> _products = new List();
  List<Product> _featuredproducts = new List();
  Profile _profile;
  final FirestoreController _firestore;

  _ProductsPageState(this._firestore);

  @override
  void initState() {
    super.initState();
    this.refreshModel(true);
    _tabController = TabController(length: 3, vsync: this);
  }

  Future<void> refreshModel(bool showIndicator) async {
    Stopwatch sw = Stopwatch()..start();
    setState(() {
      showLoadingIndicator = showIndicator;
    });
    _products = await widget._firestore.getProducts();
    _profile = widget._firestore.getCurrentUser();

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
                            itemCount: myProducts.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.75,
                            ),
                            itemBuilder: (context, index) =>
                                _productDisplay(myProducts, index),
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
                          final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => productDescription(
                                      list[index],
                                      this._profile,
                                      this._firestore)));
                          /*if (result != null) {
                            if (!list[index].appliedFor) {
                              myProducts.add(list[index]);
                              list[index].appliedFor = true;
                            } else if (list[index].appliedFor) {
                              myProducts.remove(list[index]);
                              list[index].appliedFor = false;
                            }
                          }*/
                        },
                        child: Container(
                            height: 125.0,
                            width: 125.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                image: DecorationImage(
                                    image: AssetImage("assets/fifa.jpg"),
                                    fit: BoxFit.cover)))))),
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
    _comments =
        await widget._firestore.getComments(this.product, this._profile);
    setState(() {
      if (_comments.length == 0)
        this.appliedFor = false;
      else
        this.appliedFor = true;
    });

    print("tamanho" + appliedFor.toString());
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
              child: Container(
                  height: 200.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                          alignment: Alignment.center,
                          image: AssetImage("assets/paysafe.jpg"),
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
                  product.talk.host.firstname +
                      ' ' +
                      product.talk.host.lastname,
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
          this._firestore.addComment(
              this._profile, textController.text.trim(), this.product);
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
