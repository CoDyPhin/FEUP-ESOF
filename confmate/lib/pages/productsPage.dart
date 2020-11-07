import 'package:flutter/material.dart';

import 'package:confmate/Product.dart';
import 'package:confmate/Talk.dart';
import 'package:confmate/Profile.dart';

class ProductsPage extends StatefulWidget {
  Profile profile;
  ProductsPage(this.profile);

  @override
  _ProductsPageState createState() => _ProductsPageState(this.profile);
}

class _ProductsPageState extends State<ProductsPage>
    with SingleTickerProviderStateMixin {
  Profile profile;
  TabController _tabController;

  _ProductsPageState(this.profile);
  @override
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

  static List<Talk> talksList = [
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
        talksList[1])
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
            padding: EdgeInsets.only(left: 20.0, top: 50.0),
            children: <Widget>[
              Text('Products',
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
                      child: Text('All',
                          style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 21.0,
                          )),
                    ),
                    Tab(
                      child: Text('Featured',
                          style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 21.0,
                          )),
                    ),
                    Tab(
                      child: Text('From specific talk',
                          style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 21.0,
                          )),
                    ),
                  ]),
              Container(
                  height: 500.0,
                  child: GridView.builder(
                    itemCount: productList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (context, index) =>
                        _productDisplay(productList[index]),
                  )),
            ]));
  }

  _productDisplay(Product product) {
    return Container(
        height: 390.0,
        width: 380.0,
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                Container(height: 200.0, width: 230.0),
                Positioned(
                    right: 22.5,
                    child: Container(
                      height: 160.0,
                      width: 160.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: Colors.blue[200]),
                    )),
                Positioned(
                    right: 22.5,
                    top: 20.0,
                    child: new SizedBox(
                        width: 162.5,
                        child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          productDescription(product)));
                            },
                            child: Container(
                                height: 125.0,
                                width: 125.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    image: DecorationImage(
                                        image: AssetImage(product.picture),
                                        fit: BoxFit.cover)))))),
                Positioned(
                    left: 5.0,
                    top: 165.0,
                    child: Text(
                      product.name,
                      style: TextStyle(
                          fontFamily: 'nunito',
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )),
                Positioned(
                    left: 5.0,
                    top: 185,
                    child: Text(
                      product.audience,
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

  /*_productDisplay(Product product) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              height: 180.0,
              width: 180.0,
              padding: EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                color: Colors.blue[900],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                  height: 150.0,
                  child: Image.asset(product.picture,
                      width: 10.0, height: 10.0, fit: BoxFit.fill)))
          /*Text(
            product.name,
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20.0),
          Row(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: "Price\n"),
                    TextSpan(
                      text: "${product.price}\€",
                      style: Theme.of(context).textTheme.headline4.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20.0),
              Expanded(
                child: Hero(
                  tag: "${product.id}",
                  child: Image.asset(
                    product.picture,
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ],
          )*/
        ],
      ),
    );
  }*/
}
