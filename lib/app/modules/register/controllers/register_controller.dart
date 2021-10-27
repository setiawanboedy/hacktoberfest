import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squidgame/app/data/repository/repository_remote.dart';

class RegisterController extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  TextEditingController confirmPasswordC = TextEditingController();
  TextEditingController nameC = TextEditingController();

  final RepositoryRemote _repositoryRemote = Get.find<RepositoryRemote>();

  RxBool isLoading = false.obs;

  @override
  void onInit(){
    init();
    super.onInit();
  }

  void register() {
      isLoading.value = true;
      try{
        _repositoryRemote.signUpWithEmail(
          nameC.text,
          emailC.text,
          confirmPasswordC.text,
        );
      }catch (e){
        print('Email: ' + e.toString());
      }
  }

  Future _resetFields() async {
    nameC.text = '';
    emailC.text = '';
    passwordC.text = '';
    confirmPasswordC.text = '';
  }

  init() async {
    isLoading.value = false;
    _resetFields();
  }

  @override
  void onClose() {
    emailC.dispose();
    passwordC.dispose();
    confirmPasswordC.dispose();
    nameC.dispose();
    super.onClose();
  }
}
