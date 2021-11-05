import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:squidgame/app/data/model/user_model.dart';

class FirestoreRemote{
  FirebaseFirestore _db = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  
  Stream<QuerySnapshot> getMarkerData() {
    return _db.collection('marker_challenge').snapshots();
  }

  Future<UserModel> getUserData() async {
    var user = await _db.collection('users').doc(_auth.currentUser?.uid).get();
    var userModel = UserModel.fromMap(user.data() as Map);
    return userModel;
  }

  Future updateUserPoint(int point) async {
    await _db.collection('users').doc(_auth.currentUser?.uid).update({'total_point': point});
  }

  Future<QuerySnapshot> getDataQuestions(String idMarker) async {
    return await _db.collection('marker_challenge').doc(idMarker).collection(idMarker).get();
  }
}