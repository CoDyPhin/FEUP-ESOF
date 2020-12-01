import 'package:flutter/material.dart';

import 'Product.dart';

final bool alignLabelWithHint = true;

class Profile {
  int id;
  String name;
  String job;
  String area;
  String city;
  String country;
  String photo;
  String description;
  List<Product> applied = [];

  Profile(this.id, this.name, this.job, this.area, this.city, this.country,
      this.photo, this.description);
}
