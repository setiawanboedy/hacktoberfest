import 'package:get/get.dart';
import 'package:squidgame/app/data/model/squid_model.dart';
import 'package:squidgame/app/utils/constant.dart';

class SquidRemote extends GetConnect {

  @override
  void onInit(){
    httpClient.defaultDecoder = SquidModel.fromJson;
    httpClient.baseUrl = Constants.BASE_API;
    super.onInit();
  }

  Future<Response<dynamic>> getSquidModel() async {
    return await get('?query=wisata%20lombok&key=${Constants.MAP_API_KEY}');
  }
}