import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:squidgame/app/data/provider/local/auth_local.dart';
import 'package:squidgame/app/data/provider/remote/auth_remote.dart';
import 'package:squidgame/app/data/provider/remote/firestore_remote.dart';
import 'package:squidgame/app/data/provider/remote/squid_detail_remote.dart';
import 'package:squidgame/app/data/provider/remote/squid_remote.dart';
import 'package:squidgame/app/data/repository/repository_local.dart';
import 'package:squidgame/app/data/repository/repository_remote.dart';
import 'package:squidgame/app/modules/navigation/explore/controllers/explore_controller.dart';
import 'package:squidgame/app/modules/navigation/home/controllers/home_controller.dart';
import 'package:squidgame/app/modules/navigation/profile/controllers/profile_controller.dart';

class DependencyInjection {
  static void init(){
    Get.lazyPut<FlutterSecureStorage>(() => FlutterSecureStorage(), fenix: true);
    Get.lazyPut<AuthRemote>(() => AuthRemote(), fenix: true);
    Get.lazyPut<SquidRemote>(() => SquidRemote(), fenix: true);
    Get.lazyPut<SquidDetailRemote>(() => SquidDetailRemote(), fenix: true);
    Get.lazyPut<FirestoreRemote>(() => FirestoreRemote(), fenix: true);
    Get.lazyPut<AuthLocal>(() => AuthLocal(), fenix: true);
    Get.lazyPut<RepositoryRemote>(() => RepositoryRemote(), fenix: true);
    Get.lazyPut<RepositoryLocal>(() => RepositoryLocal(), fenix: true);

    //Navigation
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<ExploreController>(() => ExploreController(), fenix: true);
    Get.lazyPut<ProfileController>(() => ProfileController(), fenix: true);
  }
}