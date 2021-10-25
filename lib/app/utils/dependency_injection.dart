import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:squidgame/app/data/provider/local/auth_local.dart';
import 'package:squidgame/app/data/provider/remote/auth_remote.dart';
import 'package:squidgame/app/data/repository/repository_local.dart';
import 'package:squidgame/app/data/repository/repository_remote.dart';

class DependencyInjection {
  static void init(){
    Get.lazyPut<FlutterSecureStorage>(() => FlutterSecureStorage(), fenix: true);
    Get.lazyPut<AuthRemote>(() => AuthRemote(), fenix: true);
    Get.lazyPut<AuthLocal>(() => AuthLocal(), fenix: true);
    Get.lazyPut<RepositoryRemote>(() => RepositoryRemote(), fenix: true);
    Get.lazyPut<RepositoryLocal>(() => RepositoryLocal(), fenix: true);
  }
}