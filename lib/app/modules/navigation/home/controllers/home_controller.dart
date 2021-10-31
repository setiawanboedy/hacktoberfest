
import 'package:get/get.dart';
import 'package:squidgame/app/data/model/squid_model.dart';
import 'package:squidgame/app/data/model/user_model.dart';
import 'package:squidgame/app/data/repository/repository_local.dart';
import 'package:squidgame/app/data/repository/repository_remote.dart';
import 'package:squidgame/app/routes/app_pages.dart';

class HomeController extends GetxController with StateMixin<SquidModel>{
  final RepositoryRemote _repositoryRemote =
  Get.find<RepositoryRemote>();
  final RepositoryLocal _repositoryLocal =
  Get.find<RepositoryLocal>();

  var _userModel = UserModel().obs;

  UserModel get user => this._userModel.value;

  @override
  void onInit() async {
    fetchList();
    await _repositoryRemote.getSquidModel();
    Map userLocal = await _repositoryLocal.session;
    _userModel(UserModel.fromMap(userLocal));
    super.onInit();
  }

  Future<void> logOut() async {
    await _repositoryLocal.clearUserLocal();
    await _repositoryRemote.signOut();
    Get.offNamedUntil(Routes.LOGIN, (_) => false);
  }

  Future<void> fetchList() async {
    final Response res = await _repositoryRemote.getSquidModel();
    if (res.hasError) {
      change(null, status: RxStatus.error(res.statusText));
    } else {
      change(res.body, status: RxStatus.success());
    }
  }

}
