import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'firebase.dart';


class AuthService {
  User getCurrentUser() {
    User user = firebaseAuth.currentUser;
    return user;
  }

  Future<bool> createUser({String email, String password}) async {
    var responce = await firebaseAuth.createUserWithEmailAndPassword(
        email: '$email', password: '$password');
    if (responce.user != null) {
      return true;
    } else {
      return false;
    }
  }

// this is user model that will be saved in firestore doc for each user on registration.
  // u can make it as u wish
  saveUserToFirestore({User user, String emai}) async {
    await usersRef.doc(user.uid).set({
      'id': user.uid,
      'email': emai,
      'date_created': Timestamp.now(),
    });
  }

  loginUser({String email, String password}) async {
    var responce = await firebaseAuth.signInWithEmailAndPassword(
        email: "$email", password: '$password');
    if (responce.user != null) {
      return true;
    } else {
      return false;
    }
  }


}
