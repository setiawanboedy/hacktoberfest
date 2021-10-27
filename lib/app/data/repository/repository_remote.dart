
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:squidgame/app/data/provider/remote/auth_remote.dart';

class RepositoryRemote{
  final AuthRemote _authRemote = Get.find<AuthRemote>();

  Future loginWithEmail(String email, String password) async {
    await _authRemote.loginWithEmail(email, password );
  }

  Future signUpWithEmail(String name, String email, String password) async {
    await _authRemote.signUpWithEmail(name, email, password);
  }

  Future resetPassword(String email) async {
    await _authRemote.resetPassword(email);
  }

  Future<void> signOut() async {
    await _authRemote.signOut();
  }

  Future<void> saveUserData({User? user}) async {
    await _authRemote.saveUserData(user: user);
  }
}