import 'package:confmate/controller/FirestoreController.dart';
import 'package:confmate/view/homePage.dart';
import 'package:confmate/view/productsPage.dart';
import 'package:confmate/view/profilePage.dart';
import 'package:confmate/view/talksPage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final FirestoreController _firestore = FirestoreController();
  final firebaseUser;

  Home(this.firebaseUser);
  @override
  _HomeState createState() => _HomeState(this.firebaseUser, this._firestore);
}

class _HomeState extends State<Home> {
  final firebaseUser;
  final FirestoreController _firestore;
  _HomeState(this.firebaseUser, this._firestore);
  bool showLoadingIndicator = false;
  ScrollController scrollController;

  Widget build(BuildContext context) {
    int _currentIndex = 0;
    PageController _pageController = PageController();
    List<Widget> _screens = [
      HomePage(_firestore, firebaseUser),
      TalksPage(_firestore),
      ProductsPage(_firestore),
      ProfilePage(_firestore, firebaseUser),
    ];

    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
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
          Icon(Icons.home_outlined, size: 30),
          Icon(Icons.chat_bubble_outline, size: 30),
          Icon(Icons.shopping_bag_outlined, size: 30),
          Icon(Icons.person_outlined, size: 30)
        ],
      ),
    );
  }
}
