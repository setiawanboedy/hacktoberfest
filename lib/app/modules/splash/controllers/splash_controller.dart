import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:squidgame/app/data/model/user_model.dart';
import 'package:squidgame/app/data/repository/repository_local.dart';
import 'package:squidgame/app/data/repository/repository_remote.dart';
import 'package:squidgame/app/routes/app_pages.dart';
import 'package:squidgame/app/utils/constant.dart';

class SplashController extends GetxController {

  final RepositoryRemote _repositoryRemote = Get.find<RepositoryRemote>();
  final RepositoryLocal _repositoryLocal = Get.find<RepositoryLocal>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _database = FirebaseFirestore.instance;

  @override
  void onInit() {
    _init();
    super.onInit();
  }

  _init() {
    _auth.authStateChanges().listen((User? user) async {
      if(user == null){
        Get.offNamedUntil(AppPages.LOGIN, (route) => false);
        print('User has sign out!');
      } else {
        DocumentSnapshot data = await _database.collection(Constants.USERS).doc(_auth.currentUser?.uid).get();
        Map userdata = data.data() as Map;
        if(userdata['uid'] == null){
          _repositoryRemote.saveUserData(user: user);
          Get.offAllNamed(AppPages.NAVIGATION);
        }else{
          _repositoryLocal.setUserLocal(UserModel.fromMap(userdata));
          Get.offAllNamed(AppPages.NAVIGATION);
        }
        print('User has sign in!');
      }
    });
  }
}
