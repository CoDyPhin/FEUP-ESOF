import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Profile.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Profile profile = Profile(
      "Wissam Ben Yedder",
      "Player at AS Monaco",
      "Football",
      "Monaco",
      "France",
      "assets/wissam.jpg",
      "Since debuting in FIFA, I have become one the most horrific terrors to face during FUT Champions. I love destroying the opponent team with my magnific moustache");
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        Stack(alignment: Alignment.topCenter, children: <Widget>[
          Positioned(
              child: Container(
                  height: 220.0,
                  width: 400.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          alignment: Alignment.center,
                          image: AssetImage("assets/background.jpg"),
                          fit: BoxFit.cover)))),
          Container(
              margin: EdgeInsets.only(top: size.height * 0.25),
              height: 550,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24)))),
          Positioned(
              top: 100.0,
              child: Container(
                  height: 150.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(200.0),
                      image: DecorationImage(
                          alignment: Alignment.center,
                          image: AssetImage(this.profile.photo),
                          fit: BoxFit.cover)))),
          Positioned(
              top: 100.0,
              left: 120.0,
              child: Container(
                  height: 40.0,
                  width: 40.0,
                  child: Icon(Icons.edit),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200.0),
                    color: Colors.white,
                  ))),
          Positioned(
              top: 270.0,
              child: Container(
                child: Text(
                  this.profile.name,
                  style: TextStyle(
                      fontFamily: 'nunito',
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              )),
          Positioned(
              top: 305.0,
              child: Container(
                child: Text(
                  profile.job,
                  style: TextStyle(
                      fontFamily: 'nunito',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[200]),
                ),
              )),
          Positioned(
              top: 400.0,
              width: 330.0,
              child: Container(
                padding: EdgeInsets.only(left: 0.0, right: 0.0),
                height: 260.0,
                width: 225.0,
                child: Text(
                  profile.description,
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              )),
          Positioned(
              top: 350.0,
              left: 30.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 30.0,
                        color: Colors.grey[400],
                      ),
                      Text(
                        profile.city + ", " + profile.country,
                        style: TextStyle(fontSize: 17, color: Colors.grey[400]),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(width: 30),
                  Row(
                    children: [
                      Icon(
                        Icons.business,
                        size: 30.0,
                        color: Colors.grey[400],
                      ),
                      Text(
                        profile.area,
                        style: TextStyle(fontSize: 17, color: Colors.grey[400]),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                ],
              )),
        ]),
      ]),
    );
  }
}
