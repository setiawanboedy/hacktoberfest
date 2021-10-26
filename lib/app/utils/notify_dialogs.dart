import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotifyDialogs{
  void emailAlready(){
    Get.defaultDialog(
        title: 'Account Exist',
        content: Text('The account already exists for that email.'),
        textConfirm: 'Ok',
        onConfirm: () => Get.back()
    );
  }
  void weakPassword(){
    Get.defaultDialog(
        title: 'Password Weak',
        content: Text('Your password is weak.'),
        textConfirm: 'Ok',
        onConfirm: () => Get.back()
    );
  }
  void wrongPassword(){
    Get.defaultDialog(
        title: 'Password Wrong',
        content: Text('Your password is Wrong.'),
        textConfirm: 'Ok',
        onConfirm: () => Get.back()
    );
  }
  void noUseEmail(){
    Get.defaultDialog(
        title: 'Email not use',
        content: Text('Try to sign up with this email.'),
        textConfirm: 'Ok',
        onConfirm: () => Get.back()
    );
  }
}