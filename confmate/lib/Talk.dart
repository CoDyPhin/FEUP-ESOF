import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'Product.dart';
import 'Profile.dart';

class Talk {
  final String name;
  final Profile host;
  final String description;
  final int seats;
  //List<int> people;
  //final photo;
  final DocumentReference reference;

  Talk(this.name, this.description, this.seats, this.host, this.reference);

  Talk.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        name = map['name'],
        host = map['hostID'],
        description = map['description'],
        seats = map['seats'];

  Talk.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);
}

class talkDescription extends StatefulWidget {
  Talk talk;
  talkDescription(this.talk);

  @override
  _talkDescriptionState createState() => _talkDescriptionState(this.talk);
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

class _talkDescriptionState extends State<talkDescription> {
  Talk talk;
  List<Product> products;
  _talkDescriptionState(this.talk);
  String bookSeat = "Book Seat";

  //Check if the seat is already booked
  void checkBooked() {
    setState(() {
      /*for (int i = 0; i < this.talk.people.length; i++)
        if (this.talk.people.elementAt(i) == 0) {
          bookSeat = "Unbook Seat";
        } else {
          bookSeat = "Book Seat";
        }*/
    });
  }

  //Booking/unbooking seat
  void bookingUnbooking() {
    setState(() {
      /*if (bookSeat == "Book Seat") {
        bookSeat = "Unbook Seat";
        this.talk.people.add(0);
      } else {
        bookSeat = "Book Seat";
        this.talk.people.remove(0);
      }*/
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
    checkBooked();
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
                  talk.host.name,
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
                //bookingUnbooking();
                bookingUnbookingAlert(context);
              },
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0)),
              child: new Text(
                "$bookSeat",
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
        bookingUnbooking();
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: Text((() {
        if (bookSeat == "Book Seat") {
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
