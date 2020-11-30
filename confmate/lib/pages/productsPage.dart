import 'package:flutter/material.dart';

import 'package:confmate/Product.dart';
import 'package:confmate/Talk.dart';
import 'package:confmate/Profile.dart';

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

List<Profile> candidates = [
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

List<Product> myProducts = [];

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  _ProductsPageState();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              title: Text("Products"),
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(
                    text: 'Featured',
                  ),
                  Tab(
                    text: 'Applied For',
                  ),
                  Tab(
                    text: 'My Products',
                  ),
                ],
              )),
          body: TabBarView(
            children: [
              Container(
                  height: 500.0,
                  child: GridView.builder(
                    itemCount: featuredList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (context, index) =>
                        _productDisplay(featuredList, index),
                  )),
              Container(
                  height: 500.0,
                  child: GridView.builder(
                    itemCount: myProducts.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (context, index) =>
                        _productDisplay(myProducts, index),
                  )),
              Container(
                  height: 500.0,
                  child: GridView.builder(
                    itemCount: productList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (context, index) =>
                        _checkWhoApplied(productList, index),
                  )),
            ],
          ),
        ));
  }

  _checkWhoApplied(List<Product> list, int index) {
    return Container(
        child: Column(
      children: <Widget>[
        Stack(
          children: [
            Container(height: 230.0, width: 230.0),
            Positioned(
                top: 30.0,
                right: 18.5,
                child: Container(
                  height: 160.0,
                  width: 160.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.blue[200]),
                )),
            Positioned(
                right: 19.0,
                top: 50.0,
                child: new SizedBox(
                    width: 162.5,
                    child: FlatButton(
                        onPressed: () async {
                          final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      productWhoApplied(list[index])));
                        },
                        child: Container(
                            height: 125.0,
                            width: 125.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                image: DecorationImage(
                                    image: AssetImage(list[index].picture),
                                    fit: BoxFit.cover)))))),
            Positioned(
                left: 20.0,
                top: 195.0,
                child: Text(
                  list[index].name,
                  style: TextStyle(
                      fontFamily: 'nunito',
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )),
            Positioned(
                left: 20.0,
                top: 212,
                child: Text(
                  productList[index].audience,
                  style: TextStyle(
                      fontFamily: 'nunito',
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38),
                )),
          ],
        ),
      ],
    ));
  }

  _productDisplay(List<Product> list, int index) {
    return Container(
        child: Column(
      children: <Widget>[
        Stack(
          children: [
            Container(height: 230.0, width: 230.0),
            Positioned(
                top: 30.0,
                right: 18.5,
                child: Container(
                  height: 160.0,
                  width: 160.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.blue[200]),
                )),
            Positioned(
                right: 19.0,
                top: 50.0,
                child: new SizedBox(
                    width: 162.5,
                    child: FlatButton(
                        onPressed: () async {
                          final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      productDescription(list[index])));
                        },
                        child: Container(
                            height: 125.0,
                            width: 125.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                image: DecorationImage(
                                    image: AssetImage(list[index].picture),
                                    fit: BoxFit.cover)))))),
            Positioned(
                left: 20.0,
                top: 195.0,
                child: Text(
                  list[index].name,
                  style: TextStyle(
                      fontFamily: 'nunito',
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )),
            Positioned(
                left: 20.0,
                top: 212,
                child: Text(
                  productList[index].audience,
                  style: TextStyle(
                      fontFamily: 'nunito',
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38),
                )),
          ],
        ),
      ],
    ));
  }
}

class productDescription extends StatefulWidget {
  Product product;

  productDescription(this.product);

  @override
  _productDescriptionState createState() =>
      _productDescriptionState(this.product);
}

class _productDescriptionState extends State<productDescription> {
  Product product;
  _productDescriptionState(this.product);

  String bookSeat = "Apply For";
  void bookingUnbooking() {
    setState(() {
      if (bookSeat == "Apply For") {
        product.appliedFor = true;
        myProducts.add(product);
        bookSeat = "Unapply For";
      } else {
        product.appliedFor = false;
        bookSeat = "Apply For";
        myProducts.remove(product);
      }
    });
  }

  bookingUnbookingAlert(BuildContext context) {
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
      title: Text("Booking Seat"),
      content: TextField(
        autofocus: true,
        maxLines: 8,
        keyboardType: TextInputType.multiline,
        decoration: new InputDecoration(hintText: 'State your reasons here'),
      ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      appBar: AppBar(backgroundColor: Colors.blue[700], elevation: 0),
      body: buildBody(context),
    );
  }

  buildBody(context) => Body(context);

  AppBar buildAppBar() => AppBar(
        backgroundColor: Colors.blue[700],
        elevation: 0,
        title: Text("Goods"),
      );

  Body(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        Stack(alignment: Alignment.topCenter, children: <Widget>[
          Container(
              margin: EdgeInsets.only(top: size.height * 0.275),
              height: 475,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24)))),
          Positioned(
              right: 30.0,
              top: 70.0,
              child: Container(
                  height: 200.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                          alignment: Alignment.center,
                          image: AssetImage(this.product.picture),
                          fit: BoxFit.cover)))),
          Positioned(
              left: 20.0,
              top: 20.0,
              child: Container(
                child: Text(
                  this.product.name,
                  style: TextStyle(
                      fontFamily: 'nunito',
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              )),
          Positioned(
              left: 20.0,
              child: Container(
                child: Text(
                  this.product.audience,
                  style: TextStyle(
                      fontFamily: 'nunito',
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              )),
          Positioned(
              left: 20.0,
              top: 300.0,
              child: Container(
                child: Text(
                  "Talk",
                  style: TextStyle(
                      fontFamily: 'nunito',
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38),
                ),
              )),
          Positioned(
              left: 20.0,
              top: 320.0,
              child: Container(
                child: Text(
                  this.product.talk.name,
                  style: TextStyle(
                      fontFamily: 'nunito',
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              )),
          Positioned(
              left: 20.0,
              top: 370.0,
              child: Container(
                child: Text(
                  "Host",
                  style: TextStyle(
                      fontFamily: 'nunito',
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38),
                ),
              )),
          Positioned(
              left: 20.0,
              top: 390.0,
              child: Container(
                child: Text(
                  this.product.talk.host.name,
                  style: TextStyle(
                      fontFamily: 'nunito',
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              )),
          Positioned(
              left: 20.0,
              top: 440.0,
              child: Container(
                child: Text(
                  "Description",
                  style: TextStyle(
                      fontFamily: 'nunito',
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38),
                ),
              )),
          Positioned(
              top: 465.0,
              width: 350.0,
              child: Column(
                children: <Widget>[
                  Text(
                    product.description,
                    style: TextStyle(
                        fontFamily: 'nunito',
                        fontSize: 15.0,
                        color: Colors.black),
                  )
                ],
              )),
          Positioned(
              top: 170.0,
              left: 20.0,
              child: Column(
                children: <Widget>[
                  Text(
                    "Units: 10",
                    style: TextStyle(
                        fontFamily: 'nunito',
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
                ],
              )),
          Positioned(
            width: 300.0,
            height: 50.0,
            top: 600.0,
            child: RaisedButton(
                onPressed: () {
                  print(bookSeat);
                  if (!product.appliedFor) {
                    bookingUnbookingAlert(context);
                  } else {
                    bookingUnbooking();
                  }
                },
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0)),
                child: product.appliedFor
                    ? Text(
                        "Unapply For",
                        style: TextStyle(
                            fontFamily: 'nunito',
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        textAlign: TextAlign.center,
                      )
                    : Text(
                        "Apply For",
                        style: TextStyle(
                            fontFamily: 'nunito',
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        textAlign: TextAlign.center,
                      )),
          ),
        ]),
      ]),
    );
  }
}

_showDialog(BuildContext context) async {
  TextEditingController customController = TextEditingController();

  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(16.0),
          title: Text("Reasons for Applying"),
          content: TextField(
            autofocus: true,
            maxLines: 8,
            controller: customController,
            keyboardType: TextInputType.multiline,
            decoration:
                new InputDecoration(hintText: 'State your reasons here'),
          ),
          actions: <Widget>[
            MaterialButton(
              child: Text('submit'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      });
  /*await showDialog<String>(
      context: context,
      child: new AlertDialog(
        contentPadding: const EdgeInsets.all(16.0),
        content: new Row(
          children: <Widget>[
            new Expanded(
              child: new TextField(
                autofocus: true,
                maxLines: 8,
                keyboardType: TextInputType.multiline,
                decoration: new InputDecoration(
                    labelText: 'Reasons for Applying',
                    hintText: 'State your reasons here'),
              ),
            )
          ],
        ),
        actions: <Widget>[
          new FlatButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(context, false);
              }),
          new FlatButton(
              child: const Text('Apply'),
              onPressed: () {
                Navigator.pop(context, true);
              })
        ],
      ),
    );*/
}

class productWhoApplied extends StatefulWidget {
  Product product;

  productWhoApplied(this.product);

  @override
  _productWhoAppliedState createState() =>
      _productWhoAppliedState(this.product);
}

class _productWhoAppliedState extends State<productWhoApplied> {
  Product product;
  _productWhoAppliedState(this.product);

  String bookSeat = "Apply For";
  void bookingUnbooking() {
    setState(() {
      if (bookSeat == "Apply For") {
        product.appliedFor = true;
        myProducts.add(product);
        bookSeat = "Unapply For";
      } else {
        product.appliedFor = false;
        bookSeat = "Apply For";
        myProducts.remove(product);
      }
    });
  }

  bookingUnbookingAlert(BuildContext context) {
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
      title: Text("Booking Seat"),
      content: TextField(
        autofocus: true,
        maxLines: 8,
        keyboardType: TextInputType.multiline,
        decoration: new InputDecoration(hintText: 'State your reasons here'),
      ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      appBar: AppBar(backgroundColor: Colors.blue[700], elevation: 0),
      body: buildBody(context),
    );
  }

  buildBody(context) => Body(context);

  AppBar buildAppBar() => AppBar(
        backgroundColor: Colors.blue[700],
        elevation: 0,
      );

  Body(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        Stack(alignment: Alignment.topCenter, children: <Widget>[
          Container(
              margin: EdgeInsets.only(top: size.height * 0.275),
              height: 475,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24)))),
          Positioned(
              right: 30.0,
              top: 70.0,
              child: Container(
                  height: 200.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                          alignment: Alignment.center,
                          image: AssetImage(this.product.picture),
                          fit: BoxFit.cover)))),
          Positioned(
              left: 20.0,
              top: 20.0,
              child: Container(
                child: Text(
                  this.product.name,
                  style: TextStyle(
                      fontFamily: 'nunito',
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              )),
          Positioned(
              left: 20.0,
              child: Container(
                child: Text(
                  this.product.audience,
                  style: TextStyle(
                      fontFamily: 'nunito',
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              )),
          Positioned(
              top: 300.0,
              child: Container(
                child: Text(
                  "Candidates",
                  style: TextStyle(
                      fontFamily: 'nunito',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38),
                ),
              )),
          Padding(
              padding: EdgeInsets.only(top: 350),
              child: Container(
                  height: 300.0,
                  child: ListView(
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.only(left: 20.0, top: 10.0),
                      children: [
                        for (Profile x in candidates) _candidateCard(x),
                      ]))),
          Positioned(
              top: 170.0,
              left: 20.0,
              child: Column(
                children: <Widget>[
                  Text(
                    "Units: 10",
                    style: TextStyle(
                        fontFamily: 'nunito',
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
                ],
              )),
        ]),
      ]),
    );
  }

  _candidateCard(Profile profile) {
    return Padding(
        padding: EdgeInsets.only(right: 15.0),
        child: FlatButton(
            onPressed: () {
              giveawayProduct(context, profile.name);
            },
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
                            profile.name,
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
                                      image: AssetImage(profile.photo),
                                      fit: BoxFit.cover)))),
                      Positioned(
                          left: 95.0,
                          top: 52.5,
                          child: Text(
                            profile.job,
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
                            profile.area,
                            style: TextStyle(
                                fontFamily: 'nunito',
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                      Positioned(
                        right: 20.0,
                        bottom: 65.0,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 40,
                          color: Colors.blue,
                        ),
                      ),
                    ]),
                  ],
                ))));
  }

  giveawayProduct(BuildContext context, String name) {
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Yes"),
      onPressed: () {
        bookingUnbooking();
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Warning"),
      content: Text("Do you wish to give this product to " + name + "?"),
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
