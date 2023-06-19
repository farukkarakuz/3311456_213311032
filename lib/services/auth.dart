import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Future<User?> signIn(String email, String password) async {
    var user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return user.user;
  }

  authmailgoster() {
    var user = _auth.currentUser;
    return user?.email.toString();
  }

  authidgoster(){
    var id=_auth.currentUser?.uid;
    return id;
  }

  authmailonaygoster() {
    var user = _auth.currentUser;
    return user?.emailVerified == true ? 'Onaylı' : 'Onaylı Değil';
  }

  signOut() async {
    return await _auth.signOut();
  }

  Future<User?> createPerson(String name, String email, String password) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    await _firestore
        .collection("Person")
        .doc(user.user!.uid)
        .set({'userName': name, 'email': email, 'password': password});

    return user.user;
  }
}
