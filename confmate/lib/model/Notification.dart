import 'package:cloud_firestore/cloud_firestore.dart';

class Notifications {
  DocumentReference attendee;
  DocumentReference product;
  DocumentReference reference;
  bool seen;
  bool accepted;

  Notifications(
      this.attendee, this.product, this.seen, this.accepted, this.reference);
}
