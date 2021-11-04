import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_toolkit/maps_toolkit.dart' as tool;
import 'package:squidgame/app/data/model/marker_model.dart';
import 'package:squidgame/app/data/repository/repository_remote.dart';
import 'package:squidgame/app/utils/constant.dart';

class ExploreController extends GetxController {
  final RepositoryRemote _repositoryRemote = Get.find<RepositoryRemote>();
  var mController = Rxn<GoogleMapController>();
  GeolocatorPlatform locator = GeolocatorPlatform.instance;

  RxMap markers = <MarkerId, Marker>{}.obs;
  RxBool mapLoading = true.obs;

  BitmapDescriptor? challengeMarker;

  var userPosition = Rxn<Position>();
  var markerModel = RxList<Result>();
  var itemChallenge = RxList<Result>();

  var index = 0.obs;

  @override
  void onInit() {
    markerModel.bindStream(getMarkerData());
    itemChallenge.bindStream(getItemMarkerChallenge());
    setCustomMaker();

    super.onInit();
  }

  @override
  void onReady() {
    getLocationPermission();
    super.onReady();
  }

  @override
  void onClose() async {
    super.onClose();
    mController.close();
  }

  set setMarker(BitmapDescriptor markers) => this.challengeMarker = markers;

  set setPosition(Position position) => this.userPosition.value = position;

  set setMapController(GoogleMapController mapController) =>
      this.mController.value = mapController;

  Stream<List<Result>> getMarkerData() {
    return _repositoryRemote.getMarkerData().map((QuerySnapshot query) {
      List<Result> listData = List.empty(growable: true);
      query.docs.forEach((DocumentSnapshot docs) {
        listData.add(Result.fromJson(docs.data() as Map<String, dynamic>));
      });
      return listData;
    });
  }

  // Distance settings
  Stream<List<Result>> getItemMarkerChallenge() {
    return _repositoryRemote.getMarkerData().map((QuerySnapshot query) {
      List<Result> listData = List.empty(growable: true);
      for(var i = 0; i < query.docs.length; i++){
        if(distanceChallenge()![i] < 100){
          listData.add(Result.fromJson(query.docs[i].data() as Map<String, dynamic>));
        }
      }
      return listData;
    });
  }

  Future setCustomMaker() async {
    await getBytesFromAsset('assets/images/squidMarker.png', 64)
        .then((onValue) {
      setMarker = BitmapDescriptor.fromBytes(onValue);
    });
  }

  /// This function for get marker from png
  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    Codec codec = await instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  void allChallenges() {
    if (markerModel.length != 0) {
      var markerList = markerModel.value;
      for (var i = 0; i < markerList.length; i++) {
        markers[MarkerId(markerList[i].markerId ?? "")] = Marker(
          markerId: MarkerId(markerList[i].markerId ?? ""),
          icon: challengeMarker ?? BitmapDescriptor.defaultMarker,
          position: LatLng(
              markerList[i].location?.latitude ?? -8.583453197331222,
              markerList[i].location?.longitude ?? 116.10029494504296),
        );
      }
    }
  }

  Future<void> getLocationPermission() async {
    final hasPermission = await _handlePermission();

    if (!hasPermission) {
      return;
    }
    var currentPosition = await locator.getCurrentPosition();
    setPosition = currentPosition;
  }

  Future<bool> _handlePermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await locator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }

    permission = await locator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await locator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return false;
    }

    return true;
  }

  Future myLocation() async {
    mController.value?.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: Constants.CAMERA_BEARING,
        target: LatLng(
          userPosition.value?.latitude ?? -8.582572687412386,
          userPosition.value?.longitude ?? 116.1013248977757,
        ),
        zoom: Constants.CAMERA_ZOOM_INIT,
      ),
    ));
  }

  void itemMarkerAnimation(int index) {
    if (markerModel[index].location != null) {
      var initPosition = CameraPosition(
        target: LatLng(markerModel[index].location!.latitude,
            markerModel[index].location!.longitude),
        zoom: Constants.CAMERA_ZOOM_INIT,
      );
      mController.value?.animateCamera(
        CameraUpdate.newCameraPosition(initPosition),
      );
    }
  }

  List<double>? distanceChallenge() {
      List<double> listNearChallenge = List.empty(growable: true);
      for (var i = 0; i < markerModel.length; i++) {
        var distance = tool.SphericalUtil.computeDistanceBetween(
            tool.LatLng(
                userPosition.value?.latitude ?? -8.582572687412386, userPosition.value?.longitude ?? 116.1013248977757),
            tool.LatLng(markerModel[i].location?.latitude ?? -8.582572687412386,
                markerModel[i].location?.longitude ?? 116.1013248977757)) /
            4.0;
        listNearChallenge.add(distance);
      }
      return listNearChallenge;
  }
}
