
import 'package:get/get.dart';
import 'package:squidgame/app/data/model/user_model.dart';
import 'package:squidgame/app/data/provider/local/auth_local.dart';

class RepositoryLocal{
  final AuthLocal _authLocal = Get.find<AuthLocal>();

  Future<void> setUserLocal(UserModel userCredential) async {
    _authLocal.setUserLocal(userCredential);
  }

  Future<void> clearUserLocal() async {
    _authLocal.clearUserLocal();
  }
  Future get session => _authLocal.getUserLocal();
}