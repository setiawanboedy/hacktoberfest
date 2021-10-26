import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:squidgame/app/data/provider/local/auth_local.dart';

class RepositoryLocal{
  final AuthLocal _authLocal = Get.find<AuthLocal>();

  Future<void> setSession(UserCredential userCredential) async {
    _authLocal.setSession(userCredential);
  }

  Future<void> clearSession() async {
    _authLocal.clearSession();
  }
  Future<void> get session => _authLocal.getSession();
}