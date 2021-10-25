import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:squidgame/app/data/repository/repository_remote.dart';

class LoginController extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  final RepositoryRemote _repositoryRemote = Get.find<RepositoryRemote>();

  RxBool isLoading = false.obs;

  void login() async {
    isLoading.value = true;
    _repositoryRemote.loginWithEmail(
      emailC.text,
      passwordC.text,
    );
  }

  @override
  void onClose() {
    emailC.dispose();
    passwordC.dispose();
    super.onClose();
  }
}
