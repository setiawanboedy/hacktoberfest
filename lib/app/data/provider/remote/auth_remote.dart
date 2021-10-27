import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:squidgame/app/utils/constant.dart';
import 'package:squidgame/app/utils/style.dart';

class AuthRemote {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future loginWithEmail(String email, String password) async {
    print("Email:::::: $email");
    print("password:::::: $password");

    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = _auth.currentUser;

      return user != null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Notify.noUseEmail();
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Notify.wrongPassword();
        print('Wrong password provided for that user.');
      }
    }
  }

  Future signUpWithEmail(String name, String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = _auth.currentUser;

      await saveUserData(name: name, user: user);

      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Notify.weakPassword();
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Notify.emailAlready();
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> saveUserData({String? name = 'Users', User? user}) async {
      await _firestore.collection(Constants.USERS).doc(user?.uid).set({
        'name': name,
        'email': user?.email,
        'uid': user?.uid,
        'photoUrl': null,
        'lastSign': user?.metadata.lastSignInTime?.toIso8601String()
      });
  }

}
