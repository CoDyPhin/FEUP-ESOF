import 'package:confmate/model/Product.dart';
import 'package:confmate/model/Profile.dart';
import 'package:confmate/model/Talk.dart';
import 'package:confmate/view/addTalkPage.dart';
import 'package:confmate/controller/FirestoreController.dart';
import 'package:confmate/view/productsPage.dart';
import 'package:confmate/view/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class TalksPage extends StatefulWidget {
  final FirestoreController _firestore;
  TalksPage(this._firestore);

  @override
  _TalksPageState createState() => _TalksPageState(this._firestore);
}

class _TalksPageState extends State<TalksPage>
    with SingleTickerProviderStateMixin {
  bool showLoadingIndicator = false;
  ScrollController scrollController;
  List<Talk> _talks = new List();
  List<Talk> _myTalks = new List();
  List<Talk> _talkstemp = new List();
  List<Talk> _featuredtalks = new List();
  final FirestoreController _firestore;
  Profile _profile;

  _TalksPageState(this._firestore);

  @override
  void initState() {
    super.initState();
    this.refreshModel(true);
  }

  Future<void> refreshModel(bool showIndicator) async {
    _talks.clear();
    _myTalks.clear();
    _talkstemp.clear();
    _featuredtalks.clear();
    Stopwatch sw = Stopwatch()..start();
    setState(() {
      showLoadingIndicator = showIndicator;
    });
    _profile = widget._firestore.getCurrentUser();
    _talkstemp = await widget._firestore.getTalks();
    for (var x = 0; x < _talkstemp.length; x++) {
      if (_talkstemp[x].host.username != _profile.username) {
        if (_talkstemp[x].featured) _featuredtalks.add(_talkstemp[x]);
        _talks.add(_talkstemp[x]);
      } else
        _myTalks.add(_talkstemp[x]);
    }
    if (this.mounted)
      setState(() {
        showLoadingIndicator = false;
      });
    print("Talks fetch time: " + sw.elapsed.toString());
  }

  @override
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
                      title: Text("Talks"),
                      actions: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            addTalkPage(this._firestore)))
                                .then((value) => this.refreshModel(true));
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
                            text: 'My Talks',
                          ),
                        ],
                      )),
                  body: TabBarView(
                    children: [
                      ListView(scrollDirection: Axis.vertical, children: [
                        for (Talk x in _featuredtalks) _talkCard(x),
                      ]),
                      ListView(scrollDirection: Axis.vertical, children: [
                        for (Talk x in _talks) _talkCard(x),
                      ]),
                      ListView(scrollDirection: Axis.vertical, children: [
                        for (Talk x in _myTalks) _talkCard(x),
                      ]),
                    ],
                  ),
                ))
            : DefaultTabController(
                length: 2,
                child: Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                      title: Text("Talks"),
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
                      ListView(scrollDirection: Axis.vertical, children: [
                        for (Talk x in _featuredtalks) _talkCard(x),
                      ]),
                      ListView(scrollDirection: Axis.vertical, children: [
                        for (Talk x in _talks) _talkCard(x),
                      ]),
                    ],
                  ),
                ));
  }

  _talkCard(Talk talk) {
    return Container(
        padding: EdgeInsets.only(top: 20.0, left: 35.0),
        height: 150.0,
        width: 325.0,
        child: Column(
          children: <Widget>[
            Stack(children: [
              Container(
                height: 10.0,
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
                  left: 12.0,
                  top: 50.0,
                  child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserPage(talk.host)));
                      },
                      child: FutureBuilder(
                        future: this._firestore.getImgURL(talk.host.photo),
                        builder: (context, url) {
                          if (url.hasData) {
                            return Container(
                                height: 60.0,
                                width: 60.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(200.0),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(url.data))));
                          } else {
                            return SizedBox(child: CircularProgressIndicator());
                          }
                        },
                      ))),
              Positioned(
                  left: 95.0,
                  top: 55.5,
                  child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserPage(talk.host)));
                      },
                      child: Text(
                        talk.host.firstname + ' ' + talk.host.lastname,
                        style: TextStyle(
                            fontFamily: 'nunito',
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ))),
              Positioned(
                  left: 105.0,
                  top: 90.0,
                  child: Text(
                    talk.host.job,
                    style: TextStyle(
                        fontFamily: 'nunito',
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
              Positioned(
                  right: 40.0,
                  bottom: -5.0,
                  child: FlatButton.icon(
                    textColor: Color(0xFF6200EE),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  talkDescription(talk, this._firestore)));
                    },
                    icon: Icon(Icons.arrow_forward_ios, size: 15),
                    label:
                        Text("MORE DETAILS", style: TextStyle(fontSize: 12.0)),
                  )),
            ]),
          ],
        ));
  }
}

class talkPromotedProducts extends StatefulWidget {
  Talk talk;
  final FirestoreController firestore;

  talkPromotedProducts(this.talk, this.firestore);

  @override
  _talkPromotedProductsState createState() =>
      _talkPromotedProductsState(this.talk, this.firestore);
}

class _talkPromotedProductsState extends State<talkPromotedProducts> {
  Talk talk;
  final FirestoreController firestore;
  List<Product> talkProducts = new List();
  bool showLoadingIndicator = true;

  _talkPromotedProductsState(this.talk, this.firestore);

  @override
  void initState() {
    super.initState();
    this.refreshModel(true);
  }

  Future<void> refreshModel(bool showIndicator) async {
    talkProducts.clear();

    talkProducts = await widget.firestore.getTalkProducts(this.talk);

    setState(() {
      showLoadingIndicator = showIndicator;
    });

    if (this.mounted)
      setState(() {
        showLoadingIndicator = false;
      });
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

  AppBar buildAppBar() =>
      AppBar(backgroundColor: Colors.blue[700], elevation: 0);

  Body(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return showLoadingIndicator
        ? SpinKitRing(
            color: Colors.blue,
          )
        : SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(top: size.height * 0.25),
                        height: size.height * 0.7,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24),
                                topRight: Radius.circular(24)))),
                    Positioned(
                        top: size.height * 0.14,
                        right: size.width * 0.675,
                        child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          UserPage(talk.host)));
                            },
                            child: FutureBuilder(
                              future: this.firestore.getImgURL(talk.host.photo),
                              builder: (context, url) {
                                if (url.hasData) {
                                  return Container(
                                      height: size.height * 0.1,
                                      width: size.height * 0.1,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.blue, width: 2.5),
                                          borderRadius: BorderRadius.circular(
                                              size.width * 0.2),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(url.data))));
                                } else {
                                  return SizedBox(
                                      child: CircularProgressIndicator());
                                }
                              },
                            ))),
                    Positioned(
                        top: size.height * 0.03,
                        child: Container(
                          width: size.width,
                          child: Text(
                            this.talk.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 35.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        )),
                    Positioned(
                        left: size.width * 0.30,
                        top: size.height * 0.155,
                        child: Container(
                            child: FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UserPage(talk.host)));
                          },
                          child: Text(
                            this.talk.host.firstname +
                                " " +
                                this.talk.host.lastname,
                            style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[200],
                            ),
                          ),
                        ))),
                    Positioned(
                        top: size.height * 0.3,
                        child: Container(
                            height: size.height * 0.3,
                            child: Text(
                              "Products",
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ))),
                    Positioned(
                      top: size.height * 0.375,
                      child: Container(
                          height: size.height * 0.6,
                          width: size.width * 0.95,
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 0.75, crossAxisCount: 2),
                            itemCount: talkProducts.length,
                            itemBuilder: (context, index) =>
                                _displayTalkProducts(talkProducts, index),
                          )),
                    )
                  ],
                )
              ],
            ),
          );
  }

  _displayTalkProducts(List<Product> products, int index) {
    Size size = MediaQuery.of(context).size;
    return Container(
        child: Column(
      children: <Widget>[
        Stack(
          children: [
            Positioned(
                child: Container(
              height: size.height * 0.2,
              width: size.width * 0.4,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Colors.blue[200]),
            )),
            for (Product p in products) productCard(p)
          ],
        )
      ],
    ));
  }

  productCard(Product product) {
    Size size = MediaQuery.of(context).size;
    return Padding(
        padding: EdgeInsets.only(top: 3.0),
        child: FlatButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => productDescription(
                        product, product.talk.host, firestore)));
          },
          child: Container(
            height: size.height * 0.2,
            width: size.width * 0.33,
            child: Column(
              children: <Widget>[
                Stack(
                  children: [
                    Container(
                        height: size.height * 0.20, width: size.width * 0.9),
                    Positioned(
                        top: 10.0,
                        right: 4.0,
                        child: FutureBuilder(
                          future: this.firestore.getImgURL(product.image),
                          builder: (context, url) {
                            if (url.hasData) {
                              return Container(
                                  height: 125.0,
                                  width: 125.0,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2.5, color: Colors.blue[700]),
                                      borderRadius: BorderRadius.circular(20.0),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(url.data))));
                            } else {
                              return SizedBox(
                                  child: CircularProgressIndicator());
                            }
                          },
                        )),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

class talkDescription extends StatefulWidget {
  Talk talk;
  final FirestoreController _firestore;

  talkDescription(this.talk, this._firestore);

  @override
  _talkDescriptionState createState() =>
      _talkDescriptionState(this.talk, this._firestore);
}

class _talkDescriptionState extends State<talkDescription> {
  Talk talk;
  final FirestoreController _firestore;

  _talkDescriptionState(this.talk, this._firestore);

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
              margin: EdgeInsets.only(top: size.height * 0.175),
              height: size.height * 0.725,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24)))),
          Positioned(
              top: size.height * 0.07,
              child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserPage(talk.host)));
                  },
                  child: FutureBuilder(
                    future: this._firestore.getImgURL(talk.host.photo),
                    builder: (context, url) {
                      if (url.hasData) {
                        return Container(
                            height: 150.0,
                            width: 150.0,
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
                  ))),
          Positioned(
              top: size.height * 0.28,
              child: Container(
                child: Text(
                  this.talk.name,
                  style: TextStyle(
                      fontFamily: 'nunito',
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              )),
          Positioned(
              top: size.height * 0.313,
              child: Container(
                  child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserPage(talk.host)));
                },
                child: Text(
                  talk.host.firstname + ' ' + talk.host.lastname,
                  style: TextStyle(
                      fontFamily: 'nunito',
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[200]),
                ),
              ))),
          Positioned(
              top: size.height * 0.475,
              width: size.width * 0.8,
              child: Container(
                padding: EdgeInsets.only(left: 0.0, right: 0.0),
                child: Text(
                  this.talk.description,
                  style: TextStyle(fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              )),
          Positioned(
            width: size.width * 0.7,
            height: size.height * 0.06,
            top: size.height * 0.78,
            child: RaisedButton(
              onPressed: () {
                bookingUnbookingAlert(context);
                setState(() {
                  talk.reference.update({'attendees': talk.attendees});
                });
              },
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)),
              child: new Text(
                talk.attendees
                        .contains(this._firestore.getCurrentUser().reference)
                    ? "Unbook Seat"
                    : "Book Seat",
                style: TextStyle(
                    fontFamily: 'nunito',
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
            width: size.width * 0.7,
            height: size.height * 0.05,
            top: size.height * 0.385,
            child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => talkPromotedProducts(
                              this.talk, this._firestore)));
                },
                textColor: Colors.grey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_cart_rounded,
                      color: Colors.black,
                    ),
                    new Text(
                      "Promoted Products",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'nunito',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                )),
          ),
        ]),
      ]),
    );
  }

  void bookingUnbookingAlert(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      textColor: Colors.white,
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Confirm"),
      textColor: Colors.white,
      onPressed: () {
        if (talk.attendees.contains(this._firestore.getCurrentUser().reference))
          talk.attendees.remove(this._firestore.getCurrentUser().reference);
        else
          talk.attendees.add(this._firestore.getCurrentUser().reference);
        setState(() {
          talk.reference.update({'attendees': talk.attendees});
        });
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Your Seat"),
      content: Text((() {
        if (talk.attendees
            .contains(this._firestore.getCurrentUser().reference)) {
          return "You're about to unbook a seat in this talk!";
        }

        return "You're about to book a seat in this talk!";
      })()),
      //Text("You're about to book a seat in this talk!"),
      actions: [
        cancelButton,
        continueButton,
      ],
      backgroundColor: Colors.lightBlue[300],
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
