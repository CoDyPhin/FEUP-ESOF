import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'Product.dart';
import 'Profile.dart';

class Talk {
  final String name;
  final Profile host;
  final String description;
  final int seats;
  final bool featured;
  List<DocumentReference> attendees;
  final DocumentReference reference;

  Talk(this.name, this.description, this.seats, this.host, this.featured,
      this.attendees, this.reference);
}
