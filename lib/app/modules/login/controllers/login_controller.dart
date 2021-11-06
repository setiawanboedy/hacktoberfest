import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:squidgame/app/data/repository/repository_remote.dart';

class LoginController extends GetxController {

  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  final RepositoryRemote _repositoryRemote = Get.find<RepositoryRemote>();

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    init();
    super.onInit();
  }
  void login() async {

    isLoading.value = true;
    try{
      _repositoryRemote.loginWithEmail(
        emailC.text,
        passwordC.text,
      );
    }catch(e){
      print(e.toString());
    }
  }

  Future _resetFields() async {
    emailC.text = '';
    passwordC.text = '';
  }

  init() async {
    isLoading.value = false;
    _resetFields();
  }

  @override
  void onClose() {
    emailC.dispose();
    passwordC.dispose();
    super.onClose();
  }
}
