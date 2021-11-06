import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:squidgame/app/data/model/squid_detail_model.dart';
import 'package:squidgame/app/data/model/squid_model.dart';
import 'package:squidgame/app/utils/constant.dart';

class SquidDataLocal {
  final FlutterSecureStorage _storage = Get.find<FlutterSecureStorage>();

  Future<void> setSquidModelLocal(SquidModel squidModel) async {
    print('squidModel:::::::::: $squidModel');

    await _storage.write(key: Constants.DB_SQUID_MODEL_KEY, value: jsonEncode(squidModel));
  }

  Future<void> clearSquidModelLocal() async {
    await _storage.delete(key: Constants.DB_SQUID_MODEL_KEY);
  }

  Future<SquidModel?> getSquidModelLocal() async {
    final String? data = await _storage.read(key: Constants.DB_SQUID_MODEL_KEY);
    if (data != null){
      final Map squid = jsonDecode(data);
      var squidModel = SquidModel.fromJson(squid);
      return squidModel;
    }
    return null;
  }

  Future<void> setSquidDetailLocal(SquidDetailModel squidDetailModel) async {
    print('squidDetail:::::::::: $squidDetailModel');

    await _storage.write(key: Constants.DB_SQUID_DETAIL_KEY, value: jsonEncode(squidDetailModel));
  }

  Future<void> clearSquidDetailLocal() async {
    await _storage.delete(key: Constants.DB_SQUID_DETAIL_KEY);
  }

  Future<SquidDetailModel?> getSquidDetailLocal() async {
    final String? data = await _storage.read(key: Constants.DB_SQUID_DETAIL_KEY);
    if (data != null){
      final Map squid = jsonDecode(data);
      var squidDetail = SquidDetailModel.fromJson(squid);
      return squidDetail;
    }
    return null;
  }
}