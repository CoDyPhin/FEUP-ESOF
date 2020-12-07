import 'package:cloud_firestore/cloud_firestore.dart';

class Notifications {
  DocumentReference attendee;
  DocumentReference product;
  DocumentReference reference;
  bool seen;

  Notifications(this.attendee, this.product, this.seen, this.reference);
}
