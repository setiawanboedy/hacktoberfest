
import 'package:get/get.dart';
import 'package:squidgame/app/data/model/squid_detail_model.dart';
import 'package:squidgame/app/data/model/squid_model.dart';
import 'package:squidgame/app/data/model/user_model.dart';
import 'package:squidgame/app/data/provider/local/auth_local.dart';
import 'package:squidgame/app/data/provider/local/squid_data_local.dart';

class RepositoryLocal{
  final AuthLocal _authLocal = Get.find<AuthLocal>();
  final SquidDataLocal _squidLocal = Get.find<SquidDataLocal>();

  Future<void> setUserLocal(UserModel userCredential) async {
    await _authLocal.setUserLocal(userCredential);
  }
  Future<void> clearUserLocal() async {
    await _authLocal.clearUserLocal();
  }
  Future get session => _authLocal.getUserLocal();

  // Data squid model
  Future<void> setSquidModel(SquidModel squidModel) async {
    await _squidLocal.setSquidModelLocal(squidModel);
  }
  Future<void> clearSquidModelLocal() async {
    await _squidLocal.clearSquidModelLocal();
  }
  Future<SquidModel?> get getSquidModel => _squidLocal.getSquidModelLocal();

  // Data squid detail model
  Future<void> setSquidDetail(SquidDetailModel squidDetailModel) async {
    await _squidLocal.setSquidDetailLocal(squidDetailModel);
  }
  Future<void> clearSquidDetailLocal() async {
    await _squidLocal.clearSquidDetailLocal();
  }
  Future<SquidDetailModel?> get getSquidDetail => _squidLocal.getSquidDetailLocal();
}