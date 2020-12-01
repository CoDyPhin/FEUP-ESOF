import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Profile.dart';

final profiles = FirebaseFirestore.instance.collection('profile').doc('1');
String profileName = "",
    profileJob = "",
    profileArea = "",
    profileCity = "",
    profileCountry = "",
    profilePhoto = "assets/confmate.png",
    profileDescription = "";

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

//----------------------------------------------------
/* class profileData extends StatefulWidget {
  @override
  _profileDataState createState() => _profileDataState();
}

class _profileDataState extends State<profileData> {
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
        Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: size.height * 0.025),
                height: 650,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24)))),
            /* style: TextStyle(
                          fontFamily: 'nunito',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ), */
          ],
        )
      ]),
    );
  }
} */
//************************************** */

class _ProfilePageState extends State<ProfilePage> {
  getProfile() {
    profiles.get().then((snapshot) {
      setState(() {
        profileName = snapshot.data()['name'];
        profileJob = snapshot.data()['job'];
        profileArea = snapshot.data()['area'];
        profileCity = snapshot.data()['city'];
        profileCountry = snapshot.data()['country'];
        profilePhoto = snapshot.data()['photo'];
        profileDescription = snapshot.data()['description'];
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getProfile();
  }

  /* Profile profile = Profile(
      0,
      "Wissam Ben Yedder",
      "Player at AS Monaco",
      "Football",
      "Monaco",
      "France",
      "assets/wissam.jpg",Since debuting in FIFA, I have become one the most horrific terrors to face during FUT Champions. I love destroying the opponent team with my magnific moustache
      "");
   */
  @override
  Widget build(BuildContext context) {
    //getProfile();
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
                          image: AssetImage(profilePhoto),
                          fit: BoxFit.cover)))),
          Positioned(
              top: 100.0,
              left: 120.0,
              child: Container(
                  height: 40.0,
                  width: 40.0,
                  child: IconButton(
                    icon: Icon(Icons.edit),
                    tooltip: 'Edit profile',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => editProfileData()));
                    },
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200.0),
                    color: Colors.white,
                  ))),
          Positioned(
              top: 270.0,
              child: Container(
                child: Text(
                  profileName,
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
                  profileJob,
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
                  profileDescription,
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
                        profileCity + ", " + profileCountry,
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
                        profileArea,
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
