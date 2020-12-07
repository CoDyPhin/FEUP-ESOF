import 'package:cloud_firestore/cloud_firestore.dart';

class Comments {
  DocumentReference attendee;
  String comment;
  DocumentReference product;
  DocumentReference reference;

  Comments(this.attendee, this.comment, this.product, this.reference);
}
