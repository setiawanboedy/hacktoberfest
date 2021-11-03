import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreRemote{
  FirebaseFirestore _db = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  
  Stream<QuerySnapshot> getMarkerData() {
    return _db.collection('marker_challenge').snapshots();;
  }
}