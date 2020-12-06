import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:confmate/model/Product.dart';
import 'package:confmate/model/Profile.dart';
import 'package:confmate/model/Talk.dart';

class FirestoreController {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
  static Profile _currentUser;

  Profile getCurrentUser() {
    return _currentUser;
  }

  void setCurrentUser(Profile user) {
    _currentUser = user;
  }

  void addUser(String firstname, String lastname, String username, String email,
      String city, String country, bool isHost) {
    firestore.collection("profile").add({
      "area": "Add Your Area!",
      "city": city,
      "country": country,
      "description":
          "No Description yet! Add a Description to your profile on the Edit Menu!",
      "email": email,
      "firstname": firstname,
      "lastname": lastname,
      "job": "Add a Job!",
      "photo": "assets/wissam.jpg",
      "username": username,
      "host": isHost
    });
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

  Future<List<Product>> getProducts() async {
    List<Future<Product>> products = new List();
    QuerySnapshot snapshot = await firestore.collection("products").get();
    for (DocumentSnapshot document in snapshot.docs) {
      products.add(_makeProductFromDoc(document));
    }
    if (snapshot.docs.length == 0) return [];
    return await Future.wait(products);
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

    DocumentReference reference = snapshot.reference;
    Profile user = Profile(firstname, lastname, job, area, city, country,
        picture, description, host, reference);

    return user;
  }

  Future<Product> _makeProductFromDoc(DocumentSnapshot snapshot) async {
    String name = snapshot.get('name');
    String description = snapshot.get('description');
    bool applied = snapshot.get('appliedFor');
    bool featured = snapshot.get('featured');
    String audience = snapshot.get('audience');
    DocumentReference userRef = snapshot.get('talkID');
    Talk talk = await _makeTalkFromDoc(await userRef.get());
    DocumentReference reference = snapshot.reference;
    return Product(name, description, audience, featured, talk, reference);
  }
}
