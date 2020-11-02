import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> userSetup(String displayName) async {
  CollectionReference talks = FirebaseFirestore.instance.collection('Talks');
  talks.add({'name': displayName});
  return;
}
