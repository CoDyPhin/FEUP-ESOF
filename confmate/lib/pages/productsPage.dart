import 'package:flutter/material.dart';

import 'package:confmate/Product.dart';
import 'package:confmate/Talk.dart';
import 'package:confmate/Profile.dart';

List<Profile> profilesList = [
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
              title: Text("Talks"),
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(
                    text: 'Featured',
                  ),
                  Tab(
                    text: 'All',
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
                    itemCount: productList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (context, index) =>
                        _productDisplay(productList, index),
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
            ],
          ),
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
                          if (result != null) {
                            if (!list[index].appliedFor) {
                              myProducts.add(list[index]);
                              list[index].appliedFor = true;
                            } else if (list[index].appliedFor) {
                              myProducts.remove(list[index]);
                              list[index].appliedFor = false;
                            }
                          }
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
                  Navigator.pop(context, true);
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
