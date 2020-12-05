import 'package:confmate/Profile.dart';
import 'package:confmate/pages/productsPage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
//import 'package:mango/firebase.dart';

import 'FirestoreController.dart';
import 'pages/profilePage.dart';
import 'pages/homePage.dart';
import 'pages/talksPage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(startApp());
}

class startApp extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Container(
            decoration: BoxDecoration(color: Colors.red),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return ConfMate();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Container(
          decoration: BoxDecoration(color: Colors.deepPurple),
        );
      },
    );
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

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    FirestoreController controller;
    final firebaseUser = context.watch<User>();
    if (firebaseUser != null) {
      Future<Profile> profile = controller.getUser(firebaseUser.email);
      return Home();
    }
    return SignInPage();
  }
}

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  AuthenticationService(this._firebaseAuth);
  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();
  Future<String> signIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signed In";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> signUp({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Signed Up";
    } on FirebaseAuthException catch (e) {}
  }
}

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: emailController,
            /*validator: (input) {
                if (input.isEmpty) {
                  return 'Please insert your email';
                }
              },
              onSaved: (input) => _email = input,*/
            decoration: InputDecoration(labelText: 'Email'),
          ),
          TextField(
            /*validator: (input) {
                if (input.length < 6) {
                  return 'Your password is too short! (Must have at least 6 characters)';
                }
              },
              onSaved: (input) => _password = input,*/
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          RaisedButton(
            onPressed: () {
              context.read<AuthenticationService>().signIn(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim());
            },
            child: Text('Sign In'),
          )
        ],
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _HomeState();
  final FirestoreController firestore = FirestoreController();

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    PageController _pageController = PageController();
    List<Widget> _screens = [
      HomePage(firestore),
      TalksPage(),
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
