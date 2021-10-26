import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:squidgame/app/data/repository/repository_remote.dart';
import 'package:squidgame/app/routes/app_pages.dart';

class SplashController extends GetxController {

  final RepositoryRemote _repositoryRemote = Get.find<RepositoryRemote>();

  @override
  void onInit() {
    _init();
    super.onInit();
  }

  _init() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if(user == null){
        Get.offNamedUntil(AppPages.LOGIN, (route) => false);
        print('User has sign out!');
      } else {
        _repositoryRemote.saveUserData(user: user);
        Get.offNamedUntil(AppPages.HOME, (route) => false);
        print('User has sign in!');
      }
    });
  }
}
