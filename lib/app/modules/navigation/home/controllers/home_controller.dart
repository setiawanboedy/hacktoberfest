
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:squidgame/app/data/repository/repository_local.dart';
import 'package:squidgame/app/data/repository/repository_remote.dart';
import 'package:squidgame/app/routes/app_pages.dart';

class HomeController extends GetxController {
  final RepositoryRemote _repositoryRemote =
  Get.find<RepositoryRemote>();
  final RepositoryLocal _repositoryLocal =
  Get.find<RepositoryLocal>();

  Rxn<User> _userValue = Rxn<User>();

  User? get user => this._userValue.value;

  @override
  void onInit(){
    // _repositoryLocal.session.then((value) => _userValue.value = value);
    super.onInit();
  }

  Future<void> logOut() async {
    await _repositoryLocal.clearSession();
    await _repositoryRemote.signOut();
    Get.offNamedUntil(Routes.LOGIN, (_) => false);
  }

}
