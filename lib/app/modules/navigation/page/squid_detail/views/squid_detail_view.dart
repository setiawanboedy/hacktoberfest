import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/squid_detail_controller.dart';

class SquidDetailView extends GetView<SquidDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: Get.height * 0.45,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              image: DecorationImage(
                  image: AssetImage('assets/images/sembalun.jpg'),
                  fit: BoxFit.fill),
            ),
            child: Stack(
              children: [
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
                          color: Colors.white24),
                      child: Icon(
                        Icons.arrow_back,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
                  'Sembalu',
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
