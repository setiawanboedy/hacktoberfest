
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:squidgame/app/routes/app_pages.dart';

class SplashController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onInit() {
    _init();
    super.onInit();
  }

  _init() {
    _auth.authStateChanges().listen((User? user) async {
      if (user == null) {
        Get.offAllNamed(AppPages.LOGIN);
        print('User has sign out!');
      } else {
        Get.offAllNamed(AppPages.NAVIGATION);
        print('User has sign in!');
      }
    });
  }
}
