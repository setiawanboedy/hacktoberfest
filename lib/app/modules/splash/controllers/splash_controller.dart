import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:squidgame/app/data/repository/repository_remote.dart';
import 'package:squidgame/app/routes/app_pages.dart';

class SplashController extends GetxController {

  final RepositoryRemote _repositoryRemote = Get.find<RepositoryRemote>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onInit() {
    _init();
    super.onInit();
  }

  _init() async {

    _auth.authStateChanges().listen((User? user) {
      if(user == null){
        Get.offNamedUntil(AppPages.LOGIN, (route) => false);
        print('User has sign out!');
      } else {
        _repositoryRemote.saveUserData(user: user);
        Get.offAllNamed(AppPages.NAVIGATION);
        print('User has sign in!');
      }
    });
  }
}
