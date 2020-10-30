import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ConfMate',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: 0,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  // ignore: deprecated_member_use
                  title: Text('Start Menu'),
                  backgroundColor: Colors.blue),
              BottomNavigationBarItem(
                  icon: Icon(Icons.chat_bubble_outline),
                  title: Text('My Talks'),
                  backgroundColor: Colors.blue),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag_outlined),
                  // ignore: deprecated_member_use
                  title: Text('My Products'),
                  backgroundColor: Colors.blue),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outlined),
                  title: Text('My Profile'),
                  backgroundColor: Colors.blue),
            ]),
        appBar: AppBar(
            title: Text('ConfMate'),
            centerTitle: true,
            backgroundColor: Colors.blue),
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
                _talkListCard('assets/tiago.jpg', 'Paysafes as Global Currency',
                    'Tiago Saramago', 'Today at 1pm'),
                _talkListCard('assets/ricardo.jpg', 'How To Protect Your Data',
                    'Ricardo Fazeres', 'Today at 3pm'),
              ])),
        ]));
  }

  _talkListCard(
      String imgPath, String talkName, String hostName, String description) {
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
                                  hostName,
                                  style: TextStyle(
                                      fontFamily: 'nunito',
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                SizedBox(height: 5.0),
                                Text(
                                  talkName,
                                  style: TextStyle(
                                      fontFamily: 'varela',
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  description,
                                  style: TextStyle(
                                      fontFamily: 'nunito',
                                      fontSize: 14.0,
                                      // fontWeight: FontWeight.w300,
                                      color: Colors.white),
                                ),
                                SizedBox(height: 10.0),
                              ]))),
                  Positioned(
                      right: 5.0,
                      bottom: 10.0,
                      child: FlatButton.icon(
                        textColor: Color(0xFF6200EE),
                        onPressed: () {
                          // Respond to button press
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
                                  image: AssetImage(imgPath),
                                  fit: BoxFit.cover))))
                ]),
              ],
            )));
  }
}
