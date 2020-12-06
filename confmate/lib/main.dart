import 'package:confmate/Profile.dart';
import 'package:confmate/authentication.dart';
import 'package:confmate/pages/homePage.dart';
import 'package:confmate/pages/productsPage.dart';
import 'package:confmate/pages/profilePage.dart';
import 'package:confmate/pages/talksPage.dart';
import 'package:confmate/signin.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/FirestoreController.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(startApp());
}

class startApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
        )
      ],
      child: MaterialApp(
        title: 'ConfMate',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  final FirestoreController firestore = FirestoreController();
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return Home(firebaseUser);
    }
    return LoginScreen(firestore);
  }
}

class ConfMate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
        ),
      ],
      child: MaterialApp(title: "ConfMate", home: AuthenticationWrapper()),
    );
  }
}

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
