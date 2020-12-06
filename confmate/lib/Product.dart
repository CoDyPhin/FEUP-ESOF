import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:confmate/Profile.dart';
import 'package:flutter/material.dart';

import 'Talk.dart';

class Product {
  String name;
  String description;
  String picture;
  String audience;
  Talk talk;
  bool featured;
  DocumentReference reference;

  Product(this.name, this.description, this.audience,
      this.featured, this.talk, this.reference);
}
