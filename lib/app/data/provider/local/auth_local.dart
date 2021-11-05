import 'dart:convert';


import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:squidgame/app/data/model/user_model.dart';
import 'package:squidgame/app/utils/constant.dart';

class AuthLocal {
  final FlutterSecureStorage _storage = Get.find<FlutterSecureStorage>();

  Future<void> setUserLocal(UserModel userCredential) async {
    print('userCredential:::::::::: $userCredential');

    await _storage.write(key: Constants.DB_USER_KEY, value: jsonEncode(userCredential));
  }

  Future<void> clearUserLocal() async {
    await _storage.delete(key: Constants.DB_USER_KEY);
  }

  Future<UserModel?> getUserLocal() async {
    final String? data = await _storage.read(key: Constants.DB_USER_KEY);
    if (data != null){
      final Map user = jsonDecode(data);
      var userModel = UserModel.fromMap(user);
      return userModel;
    }
    return null;
  }
}