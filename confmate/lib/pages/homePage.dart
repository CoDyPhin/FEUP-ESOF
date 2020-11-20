import 'package:confmate/pages/talksPage.dart';
import 'package:flutter/material.dart';

import '../Product.dart';
import '../Profile.dart';
import '../Talk.dart';
import '../pages/productsPage.dart';

class HomePage extends StatefulWidget {
  HomePage(this.profile);
  Profile profile;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static List<Profile> profilesList = [
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
        "Ricardo Fazeres",
        "Youtuber",
        "Digital Influencer",
        "Odivelas",
        "Portugal",
        "assets/ricardo.jpg",
        "How is it little people, here with you is RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRIC THE FEIZERSSSSSSSSSS"),
    Profile(
        4,
        "Caio Nogueira",
        "Student",
        "FEUP",
        "Aveiro",
        "Portugal",
        "assets/caio.png",
        "ESTE JA ESTA PERDIDO NAO NAO NAO DEIXA ME SAIR POR FAVOR"),
    Profile(5, "Pedro Queirós", "Student", "FEUP", "Penafiel", "Portugal",
        "assets/queiros.png", "Fds mén")
  ];

  static List<Talk> talksList = [
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

  int _currentIndex = 0;
  PageController _pageController = PageController();
  List<Widget> _screens = [TalksPage(), ProductsPage()];

  void _onPageChanged(int index) {
    _pageController.jumpToPage(index);
  }

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
            ],
          ),
          Container(
              height: 335.0,
              child: ListView(scrollDirection: Axis.horizontal, children: [
                for (Talk x in talksList) _talkListCard(x),
              ])),
          SizedBox(height: 40.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Featured Products',
                style: TextStyle(
                    fontFamily: 'varela',
                    fontSize: 17.0,
                    color: Color(0xFF473D3A)),
              ),
            ],
          ),
          Container(
              height: 335.0,
              child: ListView(scrollDirection: Axis.horizontal, children: [
                for (Product x in productList) _productListCard(x),
              ])),
          SizedBox(
            height: 40,
          )
        ]));
  }

  _talkListCard(Talk talk) {
    return Padding(
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
        child: Container(
            height: 200.0,
            width: 230.0,
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

  _productListCard(Product product) {
    return Padding(
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
        child: Container(
            height: 200.0,
            width: 230.0,
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
                                  product.audience,
                                  style: TextStyle(
                                      fontFamily: 'nunito',
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                SizedBox(height: 5.0),
                                Text(
                                  product.name,
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
                                  builder: (context) =>
                                      productDescription(product)));
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
                                  image: AssetImage(product.picture),
                                  fit: BoxFit.cover))))
                ]),
              ],
            )));
  }
}
