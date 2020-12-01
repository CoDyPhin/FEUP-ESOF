import 'package:flutter/material.dart';

import 'Product.dart';

final bool alignLabelWithHint = true;

class Profile {
  int id;
  String name;
  String job;
  String area;
  String city;
  String country;
  String photo;
  String description;
  List<Product> applied = [];

  Profile(this.id, this.name, this.job, this.area, this.city, this.country,
      this.photo, this.description);
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
              width: 300.0,
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
              width: 300.0,
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
              width: 300.0,
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
              width: 300.0,
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
              width: 300.0,
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
            /* style: TextStyle(
                          fontFamily: 'nunito',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ), */

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
