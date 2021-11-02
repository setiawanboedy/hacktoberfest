
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:squidgame/app/data/provider/remote/auth_remote.dart';
import 'package:squidgame/app/data/provider/remote/squid_detail_remote.dart';
import 'package:squidgame/app/data/provider/remote/squid_remote.dart';

class RepositoryRemote{
  final AuthRemote _authRemote = Get.find<AuthRemote>();
  final SquidRemote _squidRemote = Get.find<SquidRemote>();
  final SquidDetailRemote _squidDetailRemote = Get.find<SquidDetailRemote>();

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

  Future<Response<dynamic>> getSquidData() async {
    return await _squidRemote.getSquidData();
  }
  Future<Response<dynamic>> getSquidDetail(String? place_id) async {
    return await _squidDetailRemote.getSquidDetail(place_id);
  }

}