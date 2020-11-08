import 'package:confmate/Profile.dart';
import 'package:confmate/pages/productsPage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'pages/profilePage.dart';
import 'pages/homePage.dart';
import 'pages/talksPage.dart';

void main() {
  runApp(startApp());
}

class startApp extends StatelessWidget {
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
      home: ConfMate(),
    );
  }
}

class ConfMate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ConfMate',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  Profile profile = Profile(
      0,
      "Wissam Ben Yedder",
      "Player at AS Monaco",
      "Football",
      "Monaco",
      "France",
      "assets/wissam.jpg",
      "Since debuting in FIFA, I have become one the most horrific terrors to face during FUT Champions. I love destroying the opponent team with my magnific moustache");
  @override
  _HomeState createState() => _HomeState(profile);
}

class _HomeState extends State<Home> {
  Profile profile;
  _HomeState(this.profile);

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    PageController _pageController = PageController();
    List<Widget> _screens = [
      HomePage(this.profile),
      TalksPage(this.profile),
      ProductsPage(),
      ProfilePage()
    ];

    void _onPageChanged(int index) {
      _pageController.jumpToPage(index);
    }

    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.blue,
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.white,
        animationDuration: Duration(milliseconds: 200),
        animationCurve: Curves.bounceInOut,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
            _pageController.jumpToPage(_currentIndex);
          });
        },
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.chat_bubble_outline, size: 30),
          Icon(Icons.shopping_bag_outlined, size: 30),
          Icon(Icons.person_outlined, size: 30)
        ],
      ),
    );
  }
}
