import 'package:get/get.dart';
import 'package:squidgame/app/data/model/squid_model.dart';
import 'package:squidgame/app/data/model/user_model.dart';
import 'package:squidgame/app/data/repository/repository_local.dart';
import 'package:squidgame/app/data/repository/repository_remote.dart';

class HomeController extends GetxController with StateMixin<SquidModel> {
  final RepositoryRemote _repositoryRemote = Get.find<RepositoryRemote>();
  final RepositoryLocal _repositoryLocal = Get.find<RepositoryLocal>();

  UserModel? _userModel;

  UserModel? get user => this._userModel;

  Rx points = 0.obs;


  @override
  void onInit() async {
    _userModel = await _repositoryRemote.userModel;
    points.value = _userModel!.totalPoint! * 10;
    fetchList();
    await _repositoryRemote.getSquidData();
    super.onInit();
  }

  Future<void> fetchList() async {
    final Response res = await _repositoryRemote.getSquidData();
    if(res.status.connectionError){
      Get.defaultDialog(
        onConfirm: () => Get.back(),
        textConfirm: 'Ok',
        title: 'Tidak ada koneksi',
        middleText: "Apakah anda yakin ingin melanjukan secara offline ?"
      );
      var squidModel = await _repositoryLocal.getSquidModel;
      if(squidModel != null){
        change(squidModel, status: RxStatus.success());
      }
    }else{
      if (res.hasError) {
        change(null, status: RxStatus.error(res.statusText));
      } else {
        _repositoryLocal.clearSquidModelLocal();
        change(res.body, status: RxStatus.success());
        _repositoryLocal.setSquidModel(res.body);
      }
    }
  }
}
