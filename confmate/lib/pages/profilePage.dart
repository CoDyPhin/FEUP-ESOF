import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//import '../Profile.dart';

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

class editProfileData extends StatefulWidget {
  @override
  _editProfileDataState createState() => _editProfileDataState();
}

class _editProfileDataState extends State<editProfileData> {
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
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Wissam Ben Yedder'),
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
                    border: InputBorder.none, hintText: 'Monaco'),
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
                    border: InputBorder.none, hintText: 'France'),
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
                    border: InputBorder.none, hintText: 'Player at AS Monaco'),
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
                    border: InputBorder.none, hintText: 'Football'),
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
                    hintText:
                        'Since debuting in FIFA, I have become one the most horrific terrors to face during FUT Champions. I love destroying the opponent team with my magnific moustache'),
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
