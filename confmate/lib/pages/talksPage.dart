import 'package:flutter/material.dart';

import '../Profile.dart';
import '../Talk.dart';

class TalksPage extends StatefulWidget {
  Profile profile;
  TalksPage(this.profile);

  @override
  _TalksPageState createState() => _TalksPageState();
}

class _TalksPageState extends State<TalksPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

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
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
            padding: EdgeInsets.only(left: 20.0, top: 50.0),
            children: <Widget>[
              Text('Talks',
                  style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 42.0,
                      fontWeight: FontWeight.bold)),
              TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.transparent,
                  labelColor: Colors.blue,
                  isScrollable: true,
                  labelPadding: EdgeInsets.only(right: 45.0),
                  unselectedLabelColor: Color(0xFFCDCDCD),
                  tabs: [
                    Tab(
                      child: Text('Featured',
                          style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 21.0,
                          )),
                    ),
                    Tab(
                      child: Text('My Talks',
                          style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 21.0,
                          )),
                    ),
                    Tab(
                      child: Text('All Talks',
                          style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 21.0,
                          )),
                    ),
                  ]),
              Container(
                  height: 500.0,
                  child: ListView(scrollDirection: Axis.vertical, children: [
                    for (Talk x in talksList) _talkCard(x),
                  ])),
            ]));
  }

  _talkCard(Talk talk) {
    return Padding(
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
        child: Container(
            height: 150.0,
            width: 325.0,
            child: Column(
              children: <Widget>[
                Stack(children: [
                  Container(height: 150.0),
                  Positioned(
                      top: 0.0,
                      child: Container(
                        padding: EdgeInsets.only(left: 10.0, right: 0.0),
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
                        talk.name,
                        style: TextStyle(
                            fontFamily: 'varela',
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                  Positioned(
                      left: 20.0,
                      top: 50.0,
                      child: Container(
                          height: 60.0,
                          width: 60.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200.0),
                              image: DecorationImage(
                                  image: AssetImage(talk.host.photo),
                                  fit: BoxFit.cover)))),
                  Positioned(
                      left: 95.0,
                      top: 52.5,
                      child: Text(
                        talk.host.name,
                        style: TextStyle(
                            fontFamily: 'nunito',
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                  Positioned(
                      left: 95.0,
                      top: 75.0,
                      child: Text(
                        talk.host.job,
                        style: TextStyle(
                            fontFamily: 'nunito',
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                  Positioned(
                      right: 15.0,
                      bottom: 20.0,
                      child: FlatButton.icon(
                        textColor: Color(0xFF6200EE),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => talkDescription(talk)));
                        },
                        icon: Icon(Icons.arrow_forward_ios, size: 15),
                        label: Text("MORE DETAILS",
                            style: TextStyle(fontSize: 12.0)),
                      )),
                ]),
              ],
            )));
  }
}
