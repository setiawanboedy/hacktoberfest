import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:squidgame/app/utils/constant.dart';

class ExploreController extends GetxController {
  Rxn<GoogleMapController> mController = Rxn<GoogleMapController>();
  GeolocatorPlatform locator = GeolocatorPlatform.instance;

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  BitmapDescriptor? challengeMarker;
  var userPosition = Rxn<Position>();
  @override
  void onInit() {
    setCustomMaker();
    super.onInit();
  }

  @override
  void onReady() {
    getLocationPermission();
    super.onReady();
  }

  @override
  void onClose() {
    mController.close();
  }
  
  List<LatLng> listLocation = [
    LatLng(-8.58093893473821, 116.100155470182),
    LatLng(-8.581289022932495, 116.1034921380101),
    LatLng(-8.583453197331222, 116.10029494504296),
  ];

  List<MarkerId> listMarker = [
    MarkerId('marker1'),
    MarkerId('marker2'),
    MarkerId('marker3'),
  ];

  set setMarker(BitmapDescriptor markers) =>
      this.challengeMarker = markers;

  set setPosition(Position position) =>
      this.userPosition.value = position;

  set setMapController(GoogleMapController mapController) =>
      this.mController.value = mapController;

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
      for (var i = 0; i < listLocation.length; i++) {
        markers[listMarker[i]] = Marker(
          markerId: listMarker[i],
          icon: challengeMarker ?? BitmapDescriptor.defaultMarker,
          position: listLocation[i],
        );
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
    await mController.value?.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: Constants.CAMERA_BEARING,
        target: LatLng(
          userPosition.value?.latitude ?? -8.582572687412386,
          userPosition.value?.longitude ?? 116.1013248977757,
        ),
        zoom: Constants.CAMERA_ZOOM_INIT,
      ),
    ));
    print("location ${userPosition.value}");
  }
}
