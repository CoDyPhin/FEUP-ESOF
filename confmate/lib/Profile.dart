import 'package:flutter/material.dart';

import 'Product.dart';

class Profile {
  String name;
  String job;
  String area;
  String city;
  String country;
  String photo;
  String description;
  List<Product> applied;

  Profile(this.name, this.job, this.area, this.city, this.country, this.photo,
      this.description);
}
