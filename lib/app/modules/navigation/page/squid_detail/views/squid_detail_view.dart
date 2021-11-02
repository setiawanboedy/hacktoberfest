import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:squidgame/app/utils/constant.dart';

import '../controllers/squid_detail_controller.dart';

class SquidDetailView extends GetView<SquidDetailController> {
  final place_id = Get.arguments as String;
  @override
  Widget build(BuildContext context) {
    controller.placeId = place_id;
    return Scaffold(
      body: controller.obx((state) {
        controller.setMarker(state);
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: Get.height * 0.45,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        child: state?.result?.photos?[0].photoReference != null ? CachedNetworkImage(
                          imageUrl: "${Constants.IMAGE_URL}${state?.result?.photos?[0].photoReference}&key=${Constants.MAP_API_KEY}",
                          fit: BoxFit.fill,
                          placeholder: (context, url) => Transform.scale(
                            scale: 0.5,
                          ),
                        ): Icon(Icons.error),
                      ),
                    ),
                    Positioned(
                      top: 40,
                      left: 20,
                      child: InkWell(
                        onTap: () => Get.back(),
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white70),
                          child: Icon(
                            Icons.arrow_back,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '${state?.result?.name}',
                        style: TextStyle(
                            fontFamily: 'sans-serif',
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'About',
                        style: TextStyle(
                            fontFamily: 'sans-serif',
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      RichText(
                        textDirection: TextDirection.ltr,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        text: TextSpan(
                            text:
                                'Ibu kota Kecamatan Sembalun berada di Desa Sembalun Lawang, yang berjarak sekitar 45 km dari ibu kota Kabupaten Lombok Timur ( Selong ). Desa Sembalun Bumbung memiliki wilayah terluas yaitu 57,97 Km2 atau sekitar 26,70 % dari keseluruhan luas wilayah Kecamatan Sembalun, dan yang tekecil adalah Desa Sembalun Timba Gading dengan luas 15,76 Km2',
                            style: TextStyle(fontSize: 16, color: Colors.black45)),
                      ),
                      SizedBox(height: 20,),
                      Text('Location', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                      SizedBox(height: 5,),
                      Container(
                        height: Get.height * 0.25,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: GoogleMap(
                          myLocationButtonEnabled: false,
                          zoomControlsEnabled: false,
                          compassEnabled: false,
                          mapToolbarEnabled: true,
                          myLocationEnabled: false,
                          mapType: MapType.normal,
                          markers: controller.marker,
                          initialCameraPosition: CameraPosition(
                            zoom: Constants.CAMERA_ZOOM_INIT,
                            tilt: Constants.CAMERA_TILT,
                            bearing: Constants.CAMERA_BEARING,
                            target: LatLng(state?.result?.geometry?.location?.lat ?? 0.0, state?.result?.geometry?.location?.lng ?? 0.0),
                          ),
                          onMapCreated: (GoogleMapController ctrl) {
                            controller.mController.complete(ctrl);
                          }
                        ),
                      ),
                      SizedBox(height: 20,)
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
