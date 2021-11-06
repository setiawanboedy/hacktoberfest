import 'package:get/get.dart';
import 'package:squidgame/app/data/model/squid_detail_model.dart';
import 'package:squidgame/app/data/model/squid_model.dart';
import 'package:squidgame/app/utils/constant.dart';

class SquidDetailRemote extends GetConnect {

  @override
  void onInit(){
    httpClient.defaultDecoder = SquidDetailModel.fromJson;
    httpClient.baseUrl = Constants.BASE_API;
    super.onInit();
  }
  Future<Response<dynamic>> getSquidDetail(String? place_id) async {
    return await get('/details/json?place_id=$place_id&key=${Constants.MAP_API_KEY}');
  }

}