import 'package:flutter/material.dart';

class Talk {
  String name;
  String hostName;
  String description;
  String photo;

  Talk(this.name, this.hostName, this.description, this.photo);
}

class talkDescription extends StatefulWidget {
  String name;
  String hostName;
  String description;
  String photo;
  talkDescription(this.name, this.hostName, this.description, this.photo);

  @override
  _talkDescriptionState createState() => _talkDescriptionState(
      this.name, this.hostName, this.description, this.photo);
}

class _talkDescriptionState extends State<talkDescription> {
  String name;
  String hostName;
  String description;
  String photo;
  _talkDescriptionState(this.name, this.hostName, this.description, this.photo);

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
                          image: AssetImage(this.photo),
                          fit: BoxFit.cover)))),
          Positioned(
              top: 220.0,
              child: Container(
                child: Text(
                  this.name,
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
                  this.hostName,
                  style: TextStyle(
                      fontFamily: 'nunito',
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[200]),
                ),
              )),
          Positioned(
              top: 320.0,
              width: 330.0,
              child: Container(
                padding: EdgeInsets.only(left: 0.0, right: 0.0),
                height: 260.0,
                width: 225.0,
                child: Text(
                  this.description,
                  style: TextStyle(fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              )),
          Positioned(
            width: 300.0,
            height: 50.0,
            top: 600.0,
            child: RaisedButton(
              onPressed: () {},
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0)),
              child: new Text(
                "Book Seat",
                style: TextStyle(
                    fontFamily: 'nunito',
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ]),
      ]),
    );
  }
}
