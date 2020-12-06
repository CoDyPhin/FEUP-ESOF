//import 'dart:html';

import 'package:flutter/material.dart';
import 'Product.dart';

import 'Profile.dart';

List<Profile> profilesList = [
  Profile(
      1,
      "Tiago Saramago",
      "Youtuber",
      "Digital Influencer",
      "Porto",
      "Portugal",
      "assets/tiago.jpg",
      "Goods people you already know who is talking, here is Tiagovski blowing the scale"),
  Profile(
      2,
      "Ricardo Fazeres",
      "Youtuber",
      "Digital Influencer",
      "Odivelas",
      "Portugal",
      "assets/ricardo.jpg",
      "How is it little people, here with you is RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRIC THE FEIZERSSSSSSSSSS"),
  Profile(
      3,
      "Caio Nogueira",
      "Student",
      "FEUP",
      "Aveiro",
      "Portugal",
      "assets/caio.png",
      "ESTE JA ESTA PERDIDO NAO NAO NAO DEIXA ME SAIR POR FAVOR"),
  Profile(4, "Pedro Queirós", "Student", "FEUP", "Penafiel", "Portugal",
      "assets/queiros.png", "Fds mén")
];

List<Talk> talksList = [
  Talk(
      0,
      "Paysafes as Global Currency",
      profilesList[0],
      "Dedicated to PaysafeCards, I will show you how to scam people on the mythical Metin and if you want to buy coins, sell or even trade, FifaCoinsBuy has the best prices and quickness. Use code Tiagovski for an extra 8% coins.",
      25,
      new List<int>(),
      "assets/tiago.jpg"),
  Talk(
      1,
      "How To Protect Your Data",
      profilesList[1],
      "Dedicated to PaysafeCards, I will show you how to scam people on the mythical Metin and if you want to buy coins, sell or even trade, FifaCoinsBuy has the best prices and quickness. Use code Tiagovski for an extra 8% coins.",
      80,
      new List<int>(),
      "assets/ricardo.jpg"),
  Talk(
      2,
      "Ben Yedder, Guida FC Legend",
      profilesList[2],
      "AAAAHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH OH MEU DEUSSSSSSSSSSSS O QUEEEEEEEEEE NAO DEIXA ME SAIR POR FAVOR ESTE JA ESTA PERDIDO",
      35,
      new List<int>(),
      "assets/caio.png"),
  Talk(
      3,
      "CAARLOS TAS ME A OUBIR",
      profilesList[3],
      "Join me as I tell carlos if he can listen to me. Not Recommended for non deaf humans",
      12,
      new List<int>(),
      "assets/queiros.png")
];

List<Product> productList = [
  Product(
      "Paysafes roubados",
      0,
      "Paysafes scammados pelo mitico #vski no Metin. Não garantimos que ainda tenham saldo, provavelmente foram totalmente depositados em apostas no CS ou em FIFA Points.",
      0,
      "assets/paysafe.jpg",
      "For Students",
      talksList[0]),
  Product(
      "Mochila da W33D",
      5,
      "Mochila W33D on the bankz #VSKI, mas manos, W33D é só nome da marca, não é para fumar manos",
      0,
      "assets/mochila.jpg",
      "For Vskizinhos",
      talksList[0]),
  Product(
      "FIFA 21",
      1,
      "Conta do Caio de FIFA visto que ele aziou tanto que partiu o PC e não pode jogar mais. Para ajudar a EA a fazer o mesmo jogo todos os anos, preço especial de 120€",
      120,
      "assets/fifa.jpg",
      "For Pepegas",
      talksList[2]),
  Product(
      "Microfone do Queiros",
      2,
      "Apenas funciona na perfeição no Ubuntu. Melhor microfone de ear rape alguma vez visto. CAAAAAAAAAAAARLOOOOOOOOOS TAS ME A OUVIIIIIIIIIIIIIIIIIR",
      50,
      "assets/microfone.jpg",
      "For Big Kings",
      talksList[3]),
  Product(
      "Improviso pos meus subs 2",
      3,
      "Após o grande sucesso do primeiro improviso, Tiagovski volta a dar cartas com o seu mais recente single. Dedicado especialmente aos àters, mas os subs continuam no coração. Video exclusivo",
      25,
      "assets/videovski.jpg",
      "For researchers",
      talksList[1]),
  Product(
      "Patanisks The Cat",
      4,
      "Patanisks, what are you doing here? No, Patanisks, go play, don't jump on top of my computer",
      25,
      "assets/cat.jpg",
      "For researchers",
      talksList[3])
];

List<Product> featuredList = [
  Product(
      "Mochila da W33D",
      5,
      "Mochila W33D on the bankz #VSKI, mas manos, W33D é só nome da marca, não é para fumar manos",
      0,
      "assets/mochila.jpg",
      "For Vskizinhos",
      talksList[0]),
  Product(
      "FIFA 21",
      1,
      "Conta do Caio de FIFA visto que ele aziou tanto que partiu o PC e não pode jogar mais. Para ajudar a EA a fazer o mesmo jogo todos os anos, preço especial de 120€",
      120,
      "assets/fifa.jpg",
      "For Pepegas",
      talksList[2]),
  Product(
      "Microfone do Queiros",
      2,
      "Apenas funciona na perfeição no Ubuntu. Melhor microfone de ear rape alguma vez visto. CAAAAAAAAAAAARLOOOOOOOOOS TAS ME A OUVIIIIIIIIIIIIIIIIIR",
      50,
      "assets/microfone.jpg",
      "For Big Kings",
      talksList[3]),
  Product(
      "Patanisks The Cat",
      4,
      "Patanisks, what are you doing here? No, Patanisks, go play, don't jump on top of my computer",
      25,
      "assets/cat.jpg",
      "For researchers",
      talksList[3])
];

class Talk {
  int id;
  String name;
  Profile host;
  String description;
  int seats;
  List<int> people;
  String photo;

  Talk(this.id, this.name, this.host, this.description, this.seats, this.people,
      this.photo);
}

class talkDescription extends StatefulWidget {
  Talk talk;
  talkDescription(this.talk);

  @override
  _talkDescriptionState createState() => _talkDescriptionState(this.talk);
}

class talkPromotedProducts extends StatefulWidget {
  talkPromotedProducts(productList);

  @override
  _talkPromotedProductsState createState() =>
      _talkPromotedProductsState(productList);
}

class _talkPromotedProductsState extends State<talkPromotedProducts> {
  _talkPromotedProductsState(productList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      appBar: buildAppBar(),
      body: buildBody(context),
    );
  }

  buildBody(context) => Body(context);

  AppBar buildAppBar() => AppBar(
        backgroundColor: Colors.blue[700],
        elevation: 0,
        title: Text("Hello"),
      );

  Body(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[Container()],
          )
        ],
      ),
    );
  }
}

class _talkDescriptionState extends State<talkDescription> {
  Talk talk;
  List<Product> products;
  _talkDescriptionState(this.talk);
  String bookSeat = "Book Seat";

  //Check if the seat is already booked
  void checkBooked() {
    setState(() {
      for (int i = 0; i < this.talk.people.length; i++)
        if (this.talk.people.elementAt(i) == 0) {
          bookSeat = "Unbook Seat";
        } else {
          bookSeat = "Book Seat";
        }
    });
  }

  //Booking/unbooking seat
  void bookingUnbooking() {
    setState(() {
      if (bookSeat == "Book Seat") {
        bookSeat = "Unbook Seat";
        this.talk.people.add(0);
      } else {
        bookSeat = "Book Seat";
        this.talk.people.remove(0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      appBar: buildAppBar(),
      body: buildBody(context),
    );
  }

  buildBody(context) => Body(context);

  AppBar buildAppBar() =>
      AppBar(backgroundColor: Colors.blue[700], elevation: 0);

  Body(BuildContext context) {
    checkBooked();
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        Stack(alignment: Alignment.topCenter, children: <Widget>[
          Container(
              margin: EdgeInsets.only(top: size.height * 0.175),
              height: 550,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24)))),
          Positioned(
              top: 50.0,
              child: Container(
                  height: 150.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(200.0),
                      image: DecorationImage(
                          alignment: Alignment.center,
                          image: AssetImage(this.talk.photo),
                          fit: BoxFit.cover)))),
          Positioned(
              top: 220.0,
              child: Container(
                child: Text(
                  this.talk.name,
                  style: TextStyle(
                      fontFamily: 'nunito',
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              )),
          Positioned(
              top: 260.0,
              child: Container(
                child: Text(
                  this.talk.host.name,
                  style: TextStyle(
                      fontFamily: 'nunito',
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[200]),
                ),
              )),
          Positioned(
              top: 380.0,
              width: 330.0,
              child: Container(
                padding: EdgeInsets.only(left: 0.0, right: 0.0),
                height: 260.0,
                width: 225.0,
                child: Text(
                  this.talk.description,
                  style: TextStyle(fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              )),
          Positioned(
            width: 300.0,
            height: 50.0,
            top: 600.0,
            child: RaisedButton(
              onPressed: () {
                //bookingUnbooking();
                bookingUnbookingAlert(context);
              },
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0)),
              child: new Text(
                "$bookSeat",
                style: TextStyle(
                    fontFamily: 'nunito',
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
            width: 300.0,
            height: 40.0,
            top: 310.0,
            child: RaisedButton(
                onPressed: () {},
                textColor: Colors.grey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_cart_rounded,
                      color: Colors.black,
                    ),
                    new Text(
                      "Promoted Products",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'nunito',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                )),
          ),
        ]),
      ]),
    );
  }

  void bookingUnbookingAlert(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Continue"),
      onPressed: () {
        bookingUnbooking();
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Attention!"),
      content: Text((() {
        if (bookSeat == "Book Seat") {
          return "You're about to book a seat in this talk.";
        }

        return "You're about to unbook a seat in this talk.";
      })()),
      //Text("You're about to book a seat in this talk!"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
