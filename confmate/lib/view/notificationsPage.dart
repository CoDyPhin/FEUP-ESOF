import 'package:confmate/controller/FirestoreController.dart';
import 'package:confmate/model/Notification.dart';
import 'package:confmate/model/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// ignore: camel_case_types
class notificationsPage extends StatefulWidget {
  final FirestoreController _firestore;

  notificationsPage(this._firestore);

  @override
  _notificationsPageState createState() =>
      _notificationsPageState(this._firestore);
}

// ignore: camel_case_types
class _notificationsPageState extends State<notificationsPage> {
  List<Notifications> _notifications = new List();
  List<Product> _products;
  bool showLoadingIndicator = true;
  final FirestoreController _firestore;

  _notificationsPageState(this._firestore);

  @override
  void initState() {
    super.initState();
    this.refreshModel(true);
  }

  Future<void> refreshModel(bool showIndicator) async {
    Stopwatch sw = Stopwatch()..start();
    _notifications = await widget._firestore.getMyNotifications();
    _products = await widget._firestore.getProducts();

    setState(() {
      this.showLoadingIndicator = false;
    });

    print("Notifications fetch time: " + sw.elapsed.toString());
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
      title: Text("Notifications"),
      backgroundColor: Colors.blue[700],
      elevation: 0);

  // ignore: non_constant_identifier_names
  Body(BuildContext context) {
    return showLoadingIndicator
        ? SpinKitRing(
            color: Colors.white,
          )
        : ListView(scrollDirection: Axis.vertical, children: [
            for (Notifications x in _notifications) _notificationCard(x),
          ]);
  }

  _notificationCard(Notifications notification) {
    Product product;
    for (int i = 0; i < _products.length; i++) {
      if (notification.product == _products[i].reference) {
        product = _products[i];
        break;
      }
    }

    notification.reference.update({'seen': true});

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
                    product.name,
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
                    future: this._firestore.getImgURL(product.image),
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
                  top: 50.5,
                  child: Text(
                    product.talk.name,
                    style: TextStyle(
                        fontFamily: 'nunito',
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
              Positioned(
                  left: 95.0,
                  top: 70.5,
                  child: Text(
                    product.talk.host.firstname +
                        " " +
                        product.talk.host.lastname,
                    style: TextStyle(
                        fontFamily: 'nunito',
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
              Positioned(
                  left: 95.0,
                  top: 90.0,
                  child: notification.accepted
                      ? Text(
                          "You got it! Collect it at the exit!",
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      : Text(
                          "You didn't get the product!",
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
              Container(
                  padding: EdgeInsets.only(right: 55, top: 15),
                  alignment: Alignment.bottomRight,
                  child: !notification.seen
                      ? Text("NEW!",
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.red))
                      : Text("")),
            ]),
          ],
        ));
  }
}
