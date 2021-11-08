import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:squidgame/app/data/model/squid_model.dart';
import 'package:squidgame/app/modules/navigation/home/controllers/home_controller.dart';

class SeeAllController extends GetxController {
  TextEditingController searchC = TextEditingController();

  final squidModel = Get.find<HomeController>();
  var _searchResult = SquidModel().obs;
  SquidModel get searchResult => this._searchResult.value;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void searchSquid(String text){
    if(text.length == 0){
      _searchResult.value.results = [];
    }else {
      var capitalized = text.substring(0, 1).toUpperCase() + text.substring(1);
      if (squidModel.squid.results?.length != 0) {
        _searchResult.value.results = [];
        List<Result> listData = List.empty(growable: true);
        squidModel.squid.results?.forEach((element) {

          if (element.name!.contains(capitalized) || element.name!.contains(text)) {
            listData.add(Result(
              formattedAddress: element.formattedAddress,
              name: element.name,
              openingHours: element.openingHours,
              placeId: element.placeId,
              geometry: element.geometry,
              userRatingsTotal: element.userRatingsTotal,
              businessStatus: element.businessStatus,
              types: element.types,
              reference: element.reference,
              photos: element.photos,
              rating: element.rating
            ));

          }

        });
        _searchResult(SquidModel(results: listData));
        _searchResult.refresh();
      }
    }
  }
}
