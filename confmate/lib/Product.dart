import 'package:flutter/material.dart';

import 'Talk.dart';

class Product {
  String name;
  String description;
  String picture;
  String audience;
  Talk talk;
  int price, id;
  bool appliedFor = false;
  bool featured = false;

  Product(this.name, this.id, this.description, this.price, this.picture,
      this.audience, this.talk);
}
