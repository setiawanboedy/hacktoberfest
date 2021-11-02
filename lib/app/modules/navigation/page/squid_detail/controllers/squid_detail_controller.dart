import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:squidgame/app/data/model/squid_detail_model.dart';
import 'package:squidgame/app/data/repository/repository_remote.dart';

class SquidDetailController extends GetxController with StateMixin<SquidDetailModel>{
  final RepositoryRemote _repositoryRemote =
  Get.find<RepositoryRemote>();

  GoogleMapController? mapController;
  Completer<GoogleMapController> mController = Completer();

  var marker = Set<Marker>();

  var _placeId = ''.obs;

  @override
  void onReady() async{
    fetchDetail();
    await _repositoryRemote.getSquidDetail(_placeId.value);
    super.onReady();
  }

  set placeId(String place_id) => this._placeId.value = place_id;

  Future<void> fetchDetail() async {
    final Response res = await _repositoryRemote.getSquidDetail(_placeId.value);
    if (res.hasError) {
      change(null, status: RxStatus.error(res.statusText));
    } else {
      change(res.body, status: RxStatus.success());
    }
  }

  void setMarker(SquidDetailModel? state){
    marker.add(
        Marker(
          markerId: MarkerId('marker'),
          icon: BitmapDescriptor.defaultMarker,
          position: LatLng(state?.result?.geometry?.location?.lat ?? 0.0, state?.result?.geometry?.location?.lng ?? 0.0),
        )
    );
  }
}
