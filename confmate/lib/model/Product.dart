import 'package:cloud_firestore/cloud_firestore.dart';

import 'Talk.dart';

class Product {
  String name;
  String description;
  String picture;
  String audience;
  Talk talk;
  bool featured;
  int units;
  DocumentReference reference;

  Product(this.name, this.description, this.audience, this.featured, this.talk,
      this.reference);
}
