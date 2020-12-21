import 'dart:async';
import 'dart:io';

import 'package:confmate/controller/authentication.dart';
import 'package:confmate/controller/FirestoreController.dart';
import 'package:confmate/main.dart';
import 'package:confmate/view/SignInPage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import '../model/Profile.dart';

import 'package:provider/provider.dart';

Profile profile;
String _firstname;
String _lastname;
String _city;
String _country;
String _job;
String _area;
String _description;

class ProfilePage extends StatefulWidget {
  final FirestoreController _firestore;
  final _profile;
  ProfilePage(this._firestore, this._profile);

  @override
  _ProfilePageState createState() =>
      _ProfilePageState(this._profile, this._firestore);
}

class _ProfilePageState extends State<ProfilePage> {
  bool showLoadingIndicator = true;
  ScrollController scrollController;
  final _firebaseUser;
  final FirestoreController _firestore;

  _ProfilePageState(this._firebaseUser, this._firestore);

  @override
  void initState() {
    super.initState();
    this.refreshModel(true);
  }

  File _image;
  String _uploadedFileURL;

  Future<void> refreshModel(bool showIndicator) async {
    setState(() {
      showLoadingIndicator = showIndicator;
    });
    profile = await widget._firestore.getUser(this._firebaseUser.email);

    _firstname = profile.firstname;
    _lastname = profile.lastname;
    _city = profile.city;
    _country = profile.country;
    _job = profile.job;
    _area = profile.area;
    _description = profile.description;

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
                    child: profile.photo == "assets/defaultpic.jpg"
                        ? Container(
                            height: 150.0,
                            width: 150.0,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.5, color: Colors.blue[700]),
                                borderRadius: BorderRadius.circular(200.0),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage("assets/defaultpic.jpg"))),
                          )
                        : FutureBuilder(
                            future: this._firestore.getImgURL(profile.photo),
                            builder: (context, url) {
                              if (url.hasData) {
                                return Container(
                                    height: 150.0,
                                    width: 150.0,
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
                                        builder: (context) =>
                                            editProfileData(this._firestore)))
                                .then((value) {
                              setState(() {});
                            });
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
                        _firstname + ' ' + _lastname,
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
                        _job,
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
                        _description,
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
                              _city + ", " + _country,
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
                              _area,
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
                        /*Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AuthenticationWrapper()));*/
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
  final FirestoreController _firestore;
  editProfileData(this._firestore);
  @override
  _editProfileDataState createState() => _editProfileDataState(this._firestore);
}

class _editProfileDataState extends State<editProfileData> {
  final firstnameEditingController = TextEditingController();
  final lastnameEditingController = TextEditingController();
  final cityEditingController = TextEditingController();
  final countryEditingController = TextEditingController();
  final jobEditingController = TextEditingController();
  final areaEditingController = TextEditingController();
  final descriptionEditingController = TextEditingController();

  void saveData() {
    profile.reference.update({"firstname": _firstname});
    profile.reference.update({'lastname': _lastname});
    profile.reference.update({'city': _city});
    profile.reference.update({'country': _country});
    profile.reference.update({'job': _job});
    profile.reference.update({'area': _area});
    profile.reference.update({'description': _description});
  }

  final FirestoreController _firestore;

  _editProfileDataState(this._firestore);

  File _image;
  String _uploadedFileURL;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: buildAppBar(),
      body: buildBody(context),
    );
  }

  Future choosePhoto() async {
    await ImagePicker.pickImage(source: ImageSource.camera).then((image) {
      setState(() {
        _image = image;
        _uploadedFileURL = basename(image.path);
      });
    });

    this._firestore.uploadImage(this._image, "users/" + _uploadedFileURL);
    profile.reference.update({'photo': "users/" + _uploadedFileURL});
  }

  Future choosePhotoFromGallery() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image = image;
        _uploadedFileURL = basename(image.path);
      });
    });

    this._firestore.uploadImage(this._image, "users/" + _uploadedFileURL);
    profile.reference.update({'photo': "users/" + _uploadedFileURL});
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
                child: profile.photo == "assets/profilepic.jpg"
                    ? Container(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          child: Image.asset("assets/profilepic.jpg",
                              width: 150, height: 150, fit: BoxFit.contain),
                        ),
                      )
                    : FutureBuilder(
                        future: this._firestore.getImgURL(profile.photo),
                        builder: (context, url) {
                          if (url.hasData) {
                            return Container(
                                height: 150.0,
                                width: 150.0,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.blueGrey[100], width: 2),
                                    borderRadius: BorderRadius.circular(200.0),
                                    image: DecorationImage(
                                        alignment: Alignment.center,
                                        fit: BoxFit.cover,
                                        image: NetworkImage(url.data))));
                          } else {
                            return SizedBox(child: CircularProgressIndicator());
                          }
                        },
                      )),
            Positioned(
                top: 175,
                left: 270,
                child: FlatButton(
                    onPressed: choosePhotoFromGallery,
                    child: Icon(Icons.panorama, size: 35.0))),
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
                    choosePhoto();
                  },
                )),

            //First Name
            Positioned(
                left: 45,
                top: 246.0,
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
                top: 250.0,
                child: Text(
                  "First Name:",
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
              top: 260.0,
              child: TextField(
                controller: firstnameEditingController,
                onChanged: (text) {
                  this.setState(() {
                    _firstname = text;
                  });
                },
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: _firstname),
              ),
            ),
            //Last Name
            Positioned(
                left: 185,
                top: 246.0,
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
                top: 250.0,
                child: Text(
                  "Last Name:",
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
              top: 260.0,
              child: TextField(
                controller: lastnameEditingController,
                onChanged: (text) {
                  this.setState(() {
                    _lastname = text;
                  });
                },
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: _lastname),
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
                controller: cityEditingController,
                onChanged: (text) {
                  this.setState(() {
                    _city = text;
                  });
                },
                decoration:
                    InputDecoration(border: InputBorder.none, hintText: _city),
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
                controller: countryEditingController,
                onChanged: (text) {
                  this.setState(() {
                    _country = text;
                  });
                },
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: _country),
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
                controller: jobEditingController,
                onChanged: (text) {
                  this.setState(() {
                    _job = text;
                  });
                },
                decoration:
                    InputDecoration(border: InputBorder.none, hintText: _job),
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
                controller: areaEditingController,
                onChanged: (text) {
                  this.setState(() {
                    _area = text;
                  });
                },
                decoration:
                    InputDecoration(border: InputBorder.none, hintText: _area),
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
                controller: descriptionEditingController,
                onChanged: (text) {
                  this.setState(() {
                    _description = text;
                  });
                },
                //textAlignVertical: TextAlignVertical.top,
                expands: true,
                maxLines: null,

                decoration: InputDecoration(
                    border: InputBorder.none,
                    //hintMaxLines: 5,
                    //alignLabelWithHint: true,
                    hintText: _description),
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
                onPressed: () {
                  saveData();
                  Navigator.pop(context);
                },
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
  final FirestoreController firestore = FirestoreController();

  _UserPageState(this._firebaseUser);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      body: buildBody(context),
    );
  }

  buildBody(context) => Body(context);

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
              height: size.height * 0.75,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24)))),
          Positioned(
              right: size.width * 0.8,
              top: size.height * 0.05,
              child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back,
                      color: Colors.white, size: size.width * 0.075))),
          Positioned(
              top: 100.0,
              child: _firebaseUser.photo == "assets/profilepic.jpg"
                  ? Container(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        child: Image.asset("assets/profilepic.jpg",
                            width: 150, height: 150, fit: BoxFit.contain),
                      ),
                    )
                  : FutureBuilder(
                      future: this.firestore.getImgURL(_firebaseUser.photo),
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
                    )),
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
