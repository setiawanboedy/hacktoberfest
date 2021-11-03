import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:squidgame/app/utils/constant.dart';

import '../controllers/explore_controller.dart';

class ExploreView extends GetView<ExploreController> {
  @override
  Widget build(BuildContext context) {
    print(" marker ${controller.userPosition.value}");

    return Scaffold(
      body: Obx(() {
        return Stack(
          children: [
            GoogleMap(
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                compassEnabled: false,
                mapToolbarEnabled: true,
                myLocationEnabled: true,
                mapType: MapType.normal,
                markers: <Marker>{...controller.markers.values.toSet()},
                initialCameraPosition: CameraPosition(
                    zoom: Constants.CAMERA_ZOOM_INIT,
                    tilt: Constants.CAMERA_TILT,
                    bearing: Constants.CAMERA_BEARING,
                    target: LatLng(
                        controller.userPosition.value?.latitude ??
                            -8.582572687412386,
                        controller.userPosition.value?.longitude ??
                            116.1013248977757)),
                onMapCreated: (GoogleMapController ctrl) {
                  controller.setMapController = ctrl;
                  controller.allChallenges();
                }),
            Positioned(
              top: 50,
              right: 20,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 1),
                          blurRadius: 2,
                          spreadRadius: 0.6,
                          color: Colors.black54)
                    ],
                    borderRadius: BorderRadius.circular(50)),
                child: InkWell(
                  onTap: () {
                    controller.myLocation();
                    controller.allChallenges();
                  },
                  child: Center(
                    child: Icon(
                      Icons.location_searching_rounded,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
      // body: Container(
      //   margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      //   child: GridView.builder(
      //       physics: AlwaysScrollableScrollPhysics(),
      //       gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      //           maxCrossAxisExtent: 200,
      //           childAspectRatio: 5 / 6,
      //           crossAxisSpacing: 10,
      //           mainAxisSpacing: 10),
      //       itemCount: 10,
      //       itemBuilder: (BuildContext ctx, index) {
      //         return SquidItemView(
      //           func: ()=> Get.toNamed(Routes.SQUID_CHALLENGE, arguments: null),
      //         );
      //       }),
      // ),
    );
  }
}
