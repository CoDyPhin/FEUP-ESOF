import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:confmate/model/Comments.dart';
import 'package:confmate/model/Notification.dart';
import 'package:confmate/model/Product.dart';
import 'package:confmate/model/Profile.dart';
import 'package:confmate/model/Talk.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:async';

class FirestoreController {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
  static final storage = FirebaseStorage.instance;
  static Profile _currentUser;

  Profile getCurrentUser() {
    return _currentUser;
  }

  void setCurrentUser(Profile user) {
    _currentUser = user;
  }

  Future<String> getImgURL(String path) async {
    return await storage.ref(path).getDownloadURL();
  }

  uploadImage(File image, String filename) {
    final Reference storageRef = storage.ref().child(filename);
    final UploadTask task = storageRef.putFile(image);
  }

  Future<File> chooseFile() async {
    File file = await ImagePicker.pickImage(source: ImageSource.gallery);

    return file;
  }

  Future<List<Notifications>> getMyNotifications() async {
    QuerySnapshot snapshot = await firestore
        .collection("notifications")
        .where('attendee', isEqualTo: _currentUser.reference)
        .get();
    List<Future<Notifications>> notifications = new List();
    for (DocumentSnapshot document in snapshot.docs) {
      notifications.add(_makeNotificationsFromDoc(document));
    }
    if (snapshot.docs.length == 0) return [];
    print("ola" + notifications.length.toString());
    return await Future.wait(notifications);
  }

  Future<List<Comments>> getComments(Product product, Profile profile) async {
    QuerySnapshot snapshot = await firestore
        .collection("comments")
        .where('attendee', isEqualTo: profile.reference)
        .where('product', isEqualTo: product.reference)
        .get();
    List<Future<Comments>> comments = new List();
    for (DocumentSnapshot document in snapshot.docs) {
      comments.add(_makeCommentsFromDoc(document));
    }
    if (snapshot.docs.length == 0) return [];
    return await Future.wait(comments);
  }

  void addComment(Profile profile, String comment, Product product) {
    firestore.collection("comments").add({
      "attendee": profile.reference,
      "comment": comment,
      "product": product.reference,
    });
  }

  void addProduct(Talk talk, String name, String description, String audience,
      String image) {
    firestore.collection("products").add({
      "audience": audience,
      "description": description,
      "name": name,
      "talkID": talk.reference,
      "featured": true,
      "image": image
    });
  }

  void addTalk(String name, String description) {
    firestore.collection("talks").add({
      "attendees": [],
      "description": description,
      "featured": false,
      "hostID": _currentUser.reference,
      "name": name,
      "seats": 50
    });
  }

  void addNotification(Profile profile, Product product, bool seen) {
    firestore.collection("notifications").add({
      "attendee": profile.reference,
      "product": product.reference,
      "seen": seen,
    });
  }

  void addUser(String firstname, String lastname, String username, String email,
      String city, String country, bool isHost, String photo) {
    firestore.collection("profile").add({
      "area": "Area Not Specified",
      "city": city,
      "country": country,
      "description": "Description Not Specified",
      "email": email,
      "firstname": firstname,
      "lastname": lastname,
      "job": "Job Not Specified",
      "photo": photo,
      "username": username,
      "host": isHost,
    });
  }

  Future<List<Profile>> getUsers() async {
    List<Future<Profile>> users = new List();
    QuerySnapshot snapshot = await firestore.collection("profile").get();
    for (DocumentSnapshot document in snapshot.docs) {
      users.add(_makeUserFromSnapshot(document));
    }
    if (snapshot.docs.length == 0) return [];
    return await Future.wait(users);
  }

  Future<List<Comments>> getCommentsForProduct(Product product) async {
    List<Future<Comments>> comments = new List();
    QuerySnapshot snapshot = await firestore
        .collection("comments")
        .where('product', isEqualTo: product.reference)
        .get();

    for (DocumentSnapshot document in snapshot.docs) {
      comments.add(_makeCommentsFromDoc(document));
    }

    if (snapshot.docs.length == 0) return [];
    return await Future.wait(comments);
  }

  Future<Profile> getUser(String email) async {
    QuerySnapshot snapshot = await firestore
        .collection("profile")
        .where('email', isEqualTo: email)
        .limit(1)
        .get();
    Future<Profile> profile = _makeUserFromSnapshot(snapshot.docs[0]);
    if (snapshot.docs.length == 0) return null;
    return await profile;
  }

  Future<List<Talk>> getTalks() async {
    List<Future<Talk>> talks = new List();
    QuerySnapshot snapshot = await firestore.collection("talks").get();
    for (DocumentSnapshot document in snapshot.docs) {
      talks.add(_makeTalkFromDoc(document));
    }
    if (snapshot.docs.length == 0) return [];
    return await Future.wait(talks);
  }

  Future<List<Talk>> getMyTalks() async {
    List<Future<Talk>> talks = new List();
    QuerySnapshot snapshot = await firestore
        .collection("talks")
        .where('hostID', isEqualTo: _currentUser.reference)
        .get();
    for (DocumentSnapshot document in snapshot.docs) {
      talks.add(_makeTalkFromDoc(document));
    }
    if (snapshot.docs.length == 0) return [];
    return await Future.wait(talks);
  }

  Future<List<Product>> getProducts() async {
    List<Future<Product>> products = new List();
    QuerySnapshot snapshot = await firestore.collection("products").get();
    for (DocumentSnapshot document in snapshot.docs) {
      products.add(_makeProductFromDoc(document));
    }
    if (snapshot.docs.length == 0) return [];
    return await Future.wait(products);
  }

  Future<List<Product>> getTalkProducts(Talk talk) async {
    List<Future<Product>> products = new List();
    QuerySnapshot snapshot = await firestore
        .collection("products")
        .where('talkID', isEqualTo: talk.reference)
        .get();
    for (DocumentSnapshot document in snapshot.docs) {
      products.add(_makeProductFromDoc(document));
    }
    if (snapshot.docs.length == 0) return [];
    return await Future.wait(products);
  }

  Future<Comments> _makeCommentsFromDoc(DocumentSnapshot snapshot) async {
    String comment = snapshot.get('comment');
    DocumentReference attendee = snapshot.get('attendee');
    DocumentReference product = snapshot.get('product');
    DocumentReference reference = snapshot.reference;
    return Comments(attendee, comment, product, reference);
  }

  Future<Notifications> _makeNotificationsFromDoc(
      DocumentSnapshot snapshot) async {
    DocumentReference attendee = snapshot.get('attendee');
    DocumentReference product = snapshot.get('product');
    bool seen = snapshot.get('seen');
    DocumentReference reference = snapshot.reference;
    return Notifications(attendee, product, seen, reference);
  }

  Future<Talk> _makeTalkFromDoc(DocumentSnapshot snapshot) async {
    String name = snapshot.get('name');
    String description = snapshot.get('description');
    int seats = snapshot.get('seats');
    DocumentReference hostRef = snapshot.get('hostID');
    List attendeesDynamic = snapshot.get('attendees');
    List<DocumentReference> attendees =
        attendeesDynamic.cast<DocumentReference>();
    bool featured = snapshot.get('featured');
    Profile host = await _makeUserFromSnapshot(await hostRef.get());
    DocumentReference reference = snapshot.reference;
    return Talk(name, description, seats, host, featured, attendees, reference);
  }

  Future<Profile> _makeUserFromSnapshot(DocumentSnapshot snapshot) async {
    String firstname = snapshot.get('firstname');
    String lastname = snapshot.get('lastname');
    String picture = snapshot.get('photo');
    String description = snapshot.get('description');
    String area = snapshot.get('area');
    String city = snapshot.get('city');
    String country = snapshot.get('country');
    String job = snapshot.get('job');
    bool host = snapshot.get('host');
    String username = snapshot.get('username');
    DocumentReference reference = snapshot.reference;
    Profile user = Profile(username, firstname, lastname, job, area, city,
        country, picture, description, host, reference);

    return user;
  }

  Future<Product> _makeProductFromDoc(DocumentSnapshot snapshot) async {
    String name = snapshot.get('name');
    String description = snapshot.get('description');
    bool featured = snapshot.get('featured');
    String audience = snapshot.get('audience');
    String image = snapshot.get('image');
    DocumentReference userRef = snapshot.get('talkID');
    Talk talk = await _makeTalkFromDoc(await userRef.get());
    DocumentReference reference = snapshot.reference;
    return Product(
        name, description, audience, featured, talk, image, reference);
  }
}
