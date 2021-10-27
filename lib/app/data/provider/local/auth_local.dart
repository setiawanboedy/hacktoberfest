import 'dart:convert';


import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:squidgame/app/data/model/user_model.dart';
import 'package:squidgame/app/utils/constant.dart';

class AuthLocal {
  final FlutterSecureStorage _storage = Get.find<FlutterSecureStorage>();

  Future<void> setUserLocal(UserModel userCredential) async {
    print('userCredential:::::::::: $userCredential');

    await _storage.write(key: Constants.KEY, value: jsonEncode(userCredential));
  }

  Future<void> clearUserLocal() async {
    await _storage.delete(key: Constants.KEY);
  }

  Future<Map?> getUserLocal() async {
    final String? data = await _storage.read(key: Constants.KEY);
    if (data != null){
      final Map userCredential = jsonDecode(data);
      return userCredential;
    }
    return null;
  }
}