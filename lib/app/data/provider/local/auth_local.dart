import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:squidgame/app/utils/constant.dart';

class AuthLocal {
  final FlutterSecureStorage _storage = Get.find<FlutterSecureStorage>();

  Future<void> setSession(UserCredential userCredential) async {
    print('userCredential:::::::::: $userCredential');
    print('userCredential.user::::::: ${userCredential.user}');

    await _storage.write(key: Constants.KEY, value: jsonEncode(userCredential.user));
  }

  Future<void> clearSession() async {
    await _storage.delete(key: Constants.KEY);
  }

  Future<UserCredential?> getSession() async {
    final String? data = await _storage.read(key: Constants.KEY);
    if (data != null){
      final UserCredential userCredential = jsonDecode(data);
      return userCredential;
    }
    return null;
  }
}