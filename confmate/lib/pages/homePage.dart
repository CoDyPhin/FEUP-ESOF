import 'package:flutter/material.dart';

import '../Profile.dart';
import '../Talk.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static List<Profile> profilesList = [
    Profile(
        "Tiago Saramago",
        "Youtuber",
        "Digital Influencer",
        "Porto",
        "Portugal",
        "assets/tiago.jpg",
        "Goods people you already know who is talking, here is Tiagovski blowing the scale"),
    Profile(
        "Ricardo Fazeres",
        "Youtuber",
        "Digital Influencer",
        "Odivelas",
        "Portugal",
        "assets/ricardo.jpg",
        "How is it little people, here with you is RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRIC THE FEIZERSSSSSSSSSS"),
    Profile(
        "Ricardo Fazeres",
        "Youtuber",
        "Digital Influencer",
        "Odivelas",
        "Portugal",
        "assets/ricardo.jpg",
        "How is it little people, here with you is RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRIC THE FEIZERSSSSSSSSSS"),
    Profile(
        "Caio Nogueira",
        "Student",
        "FEUP",
        "Aveiro",
        "Portugal",
        "assets/caio.png",
        "ESTE JA ESTA PERDIDO NAO NAO NAO DEIXA ME SAIR POR FAVOR"),
    Profile("Pedro Queirós", "Student", "FEUP", "Penafiel", "Portugal",
        "assets/queiros.png", "Fds mén")
  ];

  List<Talk> talksList = [
    Talk(
        "Paysafes as Global Currency",
        profilesList[0],
        "Dedicated to PaysafeCards, I will show you how to scam people on the mythical Metin and if you want to buy coins, sell or even trade, FifaCoinsBuy has the best prices and quickness. Use code Tiagovski for an extra 8% coins.",
        "assets/tiago.jpg"),
    Talk(
        "How To Protect Your Data",
        profilesList[1],
        "Dedicated to PaysafeCards, I will show you how to scam people on the mythical Metin and if you want to buy coins, sell or even trade, FifaCoinsBuy has the best prices and quickness. Use code Tiagovski for an extra 8% coins.",
        "assets/ricardo.jpg"),
    Talk(
        "Ben Yedder, Guida FC Legend",
        profilesList[2],
        "AAAAHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH OH MEU DEUSSSSSSSSSSSS O QUEEEEEEEEEE NAO DEIXA ME SAIR POR FAVOR ESTE JA ESTA PERDIDO",
        "assets/caio.png"),
    Talk(
        "CAARLOS TAS ME A OUBIR",
        profilesList[3],
        "Join me as I tell carlos if he can listen to me. Not Recommended for non deaf humans",
        "assets/queiros.png")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(padding: EdgeInsets.only(left: 15.0), children: <Widget>[
          SizedBox(height: 50.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Welcome, Wissam',
                  style: TextStyle(
                      fontFamily: 'varela',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF473D3A))),
              Padding(
                padding: EdgeInsets.only(right: 30, top: 20),
                child: Container(
                  height: 75.0,
                  width: 75.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      image: DecorationImage(
                          image: AssetImage('assets/wissam.jpg'),
                          fit: BoxFit.cover)),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 100.0),
            child: Container(
              child: Text(
                'Let\'s select the best talk for you!',
                style: TextStyle(
                    fontFamily: 'nunito',
                    fontSize: 17.0,
                    fontWeight: FontWeight.w300,
                    color: Color(0xFFB0AAA7)),
              ),
            ),
          ),
          SizedBox(height: 25.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Featured Talks',
                style: TextStyle(
                    fontFamily: 'varela',
                    fontSize: 17.0,
                    color: Color(0xFF473D3A)),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  'See all',
                  style: TextStyle(
                      fontFamily: 'varela',
                      fontSize: 15.0,
                      color: Color(0xFFCEC7C4)),
                ),
              ),
            ],
          ),
          SizedBox(height: 15.0),
          Container(
              height: 410.0,
              child: ListView(scrollDirection: Axis.horizontal, children: [
                for (Talk x in talksList) _talkListCard(x),
              ])),
        ]));
  }

  _talkListCard(Talk talk) {
    return Padding(
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
        child: Container(
            height: 300.0,
            width: 225.0,
            child: Column(
              children: <Widget>[
                Stack(children: [
                  Container(height: 335.0),
                  Positioned(
                      top: 75.0,
                      child: Container(
                          padding: EdgeInsets.only(left: 10.0, right: 20.0),
                          height: 260.0,
                          width: 225.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              color: Colors.blue[200]),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 50.0,
                                ),
                                Text(
                                  talk.host.name,
                                  style: TextStyle(
                                      fontFamily: 'nunito',
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                SizedBox(height: 5.0),
                                Text(
                                  talk.name,
                                  style: TextStyle(
                                      fontFamily: 'varela',
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ]))),
                  Positioned(
                      right: 5.0,
                      bottom: 10.0,
                      child: FlatButton.icon(
                        textColor: Color(0xFF6200EE),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => talkDescription(talk)));
                        },
                        icon: Icon(Icons.arrow_forward_ios, size: 18),
                        label: Text("MORE DETAILS"),
                      )),
                  Positioned(
                      left: 70.0,
                      top: 25.0,
                      child: Container(
                          height: 90.0,
                          width: 90.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200.0),
                              image: DecorationImage(
                                  image: AssetImage(talk.photo),
                                  fit: BoxFit.cover))))
                ]),
              ],
            )));
  }
}
