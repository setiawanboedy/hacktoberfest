import 'package:get/get.dart';
import 'package:squidgame/app/data/repository/repository_local.dart';
import 'package:squidgame/app/data/repository/repository_remote.dart';
import 'package:squidgame/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  final RepositoryRemote _repositoryRemote = Get.find<RepositoryRemote>();
  final RepositoryLocal _repositoryLocal = Get.find<RepositoryLocal>();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}


  Future<void> logOut() async {
    await _repositoryLocal.clearUserLocal();
    await _repositoryRemote.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
