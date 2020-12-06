import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Product.dart';

class Profile {
  String firstname;
  String lastname;
  String job;
  String area;
  String city;
  String country;
  String photo;
  String description;
  bool host;
  DocumentReference reference;

  Profile(this.firstname, this.lastname, this.job, this.area, this.city,
      this.country, this.photo, this.description, this.host, this.reference);
}
