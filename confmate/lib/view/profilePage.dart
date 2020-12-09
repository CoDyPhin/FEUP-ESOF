import 'package:confmate/controller/authentication.dart';
import 'package:confmate/controller/FirestoreController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../model/Profile.dart';
import '../main.dart';
import 'package:provider/provider.dart';

Profile profile;

class ProfilePage extends StatefulWidget {
  final FirestoreController _firestore;
  final _profile;
  ProfilePage(this._firestore, this._profile);

  @override
  _ProfilePageState createState() => _ProfilePageState(this._profile);
}

class _ProfilePageState extends State<ProfilePage> {
  bool showLoadingIndicator = true;
  ScrollController scrollController;
  final _firebaseUser;

  _ProfilePageState(this._firebaseUser);

  @override
  void initState() {
    super.initState();
    this.refreshModel(true);
  }

  Future<void> refreshModel(bool showIndicator) async {
    setState(() {
      showLoadingIndicator = showIndicator;
    });
    profile = await widget._firestore.getUser(this._firebaseUser.email);
    if (this.mounted)
      setState(() {
        showLoadingIndicator = false;
      });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return showLoadingIndicator
        ? SpinKitRing(
            color: Colors.blue,
          )
        : SingleChildScrollView(
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
                    height: 450,
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
                                image: AssetImage("assets/wissam.jpg"),
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
                        profile.firstname + ' ' + profile.lastname,
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
                              style: TextStyle(
                                  fontSize: 17, color: Colors.grey[400]),
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
                              style: TextStyle(
                                  fontSize: 17, color: Colors.grey[400]),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )
                      ],
                    )),
                Positioned(
                    top: 40.0,
                    right: 25.0,
                    child: FloatingActionButton(
                      onPressed: () {
                        context.read<AuthenticationService>().signOut();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AuthenticationWrapper()));
                      },
                      child: Icon(Icons.exit_to_app),
                      backgroundColor: Colors.red,
                    )),
              ]),
            ]),
          );
  }
}

class editProfileData extends StatefulWidget {
  @override
  _editProfileDataState createState() => _editProfileDataState();
}

class _editProfileDataState extends State<editProfileData> {
  String _name, _city, _country, _job, _area, _description;
  final nameEditingController = TextEditingController();
  final cityEditingController = TextEditingController();
  final countryEditingController = TextEditingController();
  final jobEditingController = TextEditingController();
  final areaEditingController = TextEditingController();
  final descriptionEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: buildAppBar(),
      body: buildBody(context),
    );
  }

  buildBody(context) => Body(context);

  AppBar buildAppBar() =>
      AppBar(backgroundColor: Colors.blue[200], elevation: 0);

  Body(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(
                    top: size.height * 0,
                    left: size.height * 0.05,
                    right: size.height * 0.05),
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.lightBlue[100],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24)))),
            Container(
                margin: EdgeInsets.only(top: size.height * 0.01),
                height: 850,
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24)))),
            Positioned(
                top: 50.0,
                child: Container(
                    height: 150.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.blueGrey[100], width: 2),
                        borderRadius: BorderRadius.circular(200.0),
                        image: DecorationImage(
                            alignment: Alignment.center,
                            image: AssetImage("assets/wissam.jpg"),
                            fit: BoxFit.cover)))),
            Positioned(
                top: 180.0,
                left: 250,
                child: InkWell(
                  child: Container(
                      height: 35.0,
                      width: 35.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              alignment: Alignment.center,
                              image: AssetImage("assets/camera.png"),
                              fit: BoxFit.cover))),
                  onTap: () {
                    //atualizar imagem
                  },
                )),
            //Name
            Positioned(
                left: 45,
                top: 246.0,
                child: Container(
                    height: 48.0,
                    width: 200.0,
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      border:
                          Border.all(color: Colors.lightBlue[100], width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    ))),
            Positioned(
              left: 50,
              top: 250.0,
              child: Container(
                  child: Text(
                "Name:",
                style: TextStyle(
                    fontFamily: 'nunito',
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[700]),
              )),
            ),
            Positioned(
              left: 50,
              width: 190.0,
              height: 40.0,
              top: 260.0,
              child: TextField(
                controller: nameEditingController,
                onChanged: (text) {
                  this.setState(() {
                    _name = text;
                  });
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: profile.firstname + ' ' + profile.lastname),
              ),
            ),
            //City
            Positioned(
                left: 45,
                top: 316.0,
                child: Container(
                    height: 48.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      border:
                          Border.all(color: Colors.lightBlue[100], width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    ))),
            Positioned(
                left: 50,
                top: 320.0,
                child: Text(
                  "City:",
                  style: TextStyle(
                      fontFamily: 'nunito',
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey[700]),
                )),
            Positioned(
              left: 50,
              width: 110.0,
              height: 40.0,
              top: 330.0,
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: profile.city),
              ),
            ),
            //Country
            Positioned(
                left: 185,
                top: 316.0,
                child: Container(
                    height: 48.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      border:
                          Border.all(color: Colors.lightBlue[100], width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    ))),
            Positioned(
                left: 190,
                top: 320.0,
                child: Text(
                  "Country:",
                  style: TextStyle(
                      fontFamily: 'nunito',
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey[700]),
                )),
            Positioned(
              left: 190,
              width: 110.0,
              height: 40.0,
              top: 330.0,
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: profile.country),
              ),
            ),
            //Job
            Positioned(
                left: 45,
                top: 386.0,
                child: Container(
                    height: 48.0,
                    width: 200.0,
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      border:
                          Border.all(color: Colors.lightBlue[100], width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    ))),
            Positioned(
                left: 50,
                top: 390.0,
                child: Text(
                  "Job:",
                  style: TextStyle(
                      fontFamily: 'nunito',
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey[700]),
                )),
            Positioned(
              left: 50,
              width: 190.0,
              height: 40.0,
              top: 400.0,
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: profile.job),
              ),
            ),
            //Area
            Positioned(
                left: 45,
                top: 456.0,
                child: Container(
                    height: 48.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      border:
                          Border.all(color: Colors.lightBlue[100], width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    ))),
            Positioned(
                left: 50,
                top: 460.0,
                child: Text(
                  "Area:",
                  style: TextStyle(
                      fontFamily: 'nunito',
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey[700]),
                )),
            Positioned(
              left: 50,
              width: 110.0,
              height: 40.0,
              top: 470.0,
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: profile.area),
              ),
            ),
            //Description
            Positioned(
                left: 45,
                top: 526.0,
                child: Container(
                    height: 105.0,
                    width: 300.0,
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      border:
                          Border.all(color: Colors.lightBlue[100], width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    ))),
            Positioned(
                left: 50,
                top: 530.0,
                child: Text(
                  "Description:",
                  style: TextStyle(
                      fontFamily: 'nunito',
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey[700]),
                )),
            Positioned(
              left: 50,
              width: 297.0,
              height: 100.0,
              top: 540.0,
              child: TextFormField(
                //textAlignVertical: TextAlignVertical.top,
                expands: true,
                maxLines: null,

                decoration: InputDecoration(
                    border: InputBorder.none,
                    //hintMaxLines: 5,
                    //alignLabelWithHint: true,
                    hintText: profile.description),
              ),
            ),
            Positioned(
              top: 655.0,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(width: 2, color: Colors.blue[200])),
                color: Colors.blue[700],
                textColor: Colors.lightBlue[100],
                padding: EdgeInsets.all(8.0),
                onPressed: () {},
                child: Text(
                  "SAVE",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }
}

class UserPage extends StatefulWidget {
  final _profile;
  UserPage(this._profile);

  @override
  _UserPageState createState() => _UserPageState(this._profile);
}

class _UserPageState extends State<UserPage> {
  bool showLoadingIndicator = true;
  ScrollController scrollController;
  final _firebaseUser;

  _UserPageState(this._firebaseUser);

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
              height: 450,
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
                          image: AssetImage(_firebaseUser.photo),
                          fit: BoxFit.cover)))),
          /*Positioned(
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
                ),*/
          Positioned(
              top: 270.0,
              child: Container(
                child: Text(
                  _firebaseUser.firstname + ' ' + _firebaseUser.lastname,
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
                  _firebaseUser.job,
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
                  _firebaseUser.description,
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
                        _firebaseUser.city + ", " + _firebaseUser.country,
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
                        _firebaseUser.area,
                        style: TextStyle(fontSize: 17, color: Colors.grey[400]),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                ],
              )),
          /*Positioned(
                    top: 40.0,
                    right: 25.0,
                    child: FloatingActionButton(
                      onPressed: () {
                        context.read<AuthenticationService>().signOut();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AuthenticationWrapper()));
                      },
                      child: Icon(Icons.exit_to_app),
                      backgroundColor: Colors.red,
                    )),*/
        ]),
      ]),
    );
  }
}
