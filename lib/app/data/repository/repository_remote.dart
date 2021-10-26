
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:squidgame/app/data/provider/remote/auth_remote.dart';

class RepositoryRemote{
  final AuthRemote _authRemote = Get.find<AuthRemote>();

  Future loginWithEmail(String email, String password) async {
    _authRemote.loginWithEmail(email, password );
  }

  Future signUpWithEmail(String name, String email, String password) async {
    _authRemote.signUpWithEmail(name, email, password);
  }

  Future resetPassword(String email) async {
    _authRemote.resetPassword(email);
  }

  Future<void> signOut() async {
    await _authRemote.signOut();
  }

  Future<void> saveUserData({String? name, User? user}) async {
    _authRemote.saveUserData(name: name, user: user);
  }
}