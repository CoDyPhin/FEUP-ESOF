import 'package:cloud_firestore/cloud_firestore.dart';

class Profile {
  String username;
  String firstname;
  String lastname;
  String job;
  String area;
  String city;
  String country;
  String photo;
  String description;
  bool isHost;
  DocumentReference reference;

  Profile(
      this.username,
      this.firstname,
      this.lastname,
      this.job,
      this.area,
      this.city,
      this.country,
      this.photo,
      this.description,
      this.isHost,
      this.reference);
}
