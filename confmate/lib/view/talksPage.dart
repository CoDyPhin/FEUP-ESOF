import 'package:confmate/model/Product.dart';
import 'package:confmate/model/Profile.dart';
import 'package:confmate/model/Talk.dart';
import 'package:confmate/view/addTalkPage.dart';
import 'package:confmate/controller/FirestoreController.dart';
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
                  left: 20.0,
                  top: 50.0,
                  child: Container(
                      height: 60.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200.0),
                          image: DecorationImage(
                              image: AssetImage("assets/tiago.jpg"),
                              fit: BoxFit.cover)))),
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
  List<Product> products;

  talkPromotedProducts(this.products);

  @override
  _talkPromotedProductsState createState() =>
      _talkPromotedProductsState(this.products);
}

class _talkPromotedProductsState extends State<talkPromotedProducts> {
  List<Product> products;

  _talkPromotedProductsState(this.products);

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
      child: Column(
        children: <Widget>[],
      ),
    );
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
  List<Product> products;
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
              height: 550,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24)))),
          Positioned(
              top: 50.0,
              child: Container(
                  height: 150.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(200.0),
                      image: DecorationImage(
                          alignment: Alignment.center,
                          image: AssetImage(talk.host.photo),
                          fit: BoxFit.cover)))),
          Positioned(
              top: 220.0,
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
              top: 260.0,
              child: Container(
                child: Text(
                  talk.host.firstname + ' ' + talk.host.lastname,
                  style: TextStyle(
                      fontFamily: 'nunito',
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[200]),
                ),
              )),
          Positioned(
              top: 380.0,
              width: 330.0,
              child: Container(
                padding: EdgeInsets.only(left: 0.0, right: 0.0),
                height: 260.0,
                width: 225.0,
                child: Text(
                  this.talk.description,
                  style: TextStyle(fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              )),
          Positioned(
            width: 300.0,
            height: 50.0,
            top: 600.0,
            child: RaisedButton(
              onPressed: () {
                bookingUnbookingAlert(context);
                setState(() {
                  talk.reference.update({'attendees': talk.attendees});
                });
              },
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0)),
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
            width: 300.0,
            height: 40.0,
            top: 310.0,
            child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              talkPromotedProducts(products)));
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
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Continue"),
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
      title: Text("AlertDialog"),
      content: Text((() {
        if (talk.attendees
            .contains(this._firestore.getCurrentUser().reference)) {
          return "You're about to book a seat in this talk!";
        }

        return "You're about to unbook a seat in this talk!";
      })()),
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
