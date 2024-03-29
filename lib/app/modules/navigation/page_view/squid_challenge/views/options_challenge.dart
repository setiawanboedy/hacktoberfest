import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squidgame/app/data/model/marker_model.dart';
import 'package:squidgame/app/modules/navigation/page_view/squid_challenge/controllers/option_controller.dart';
import 'package:squidgame/app/routes/app_pages.dart';

class OptionChallenges extends GetView<OptionController> {
  final challengeInfo = Get.arguments as Result;

  @override
  Widget build(BuildContext context) {
    controller.setDuration = challengeInfo;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(onTap: () => Get.offAllNamed(Routes.NAVIGATION,), child: Icon(Icons.arrow_back),),
        centerTitle: true, title: Text('Pilih Tantangan'),),
      body: Center(
        child: Column(
          children: [
            Spacer(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 35),
              decoration: BoxDecoration(
                color: Colors.black45
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Nama Tantangan  ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                          Text('Jumlah point  ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                          Text('Durasi selesai  ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(':  ${challengeInfo.name}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                          Text(':  ${challengeInfo.point} Point', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                          Text(':  ${challengeInfo.time} Detik', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
            Container(
              width: Get.width * 0.8,
              height: Get.height * 0.3,
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Obx(() {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Pilih Jenis Penyelesaian ",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
                          SizedBox(height: 20,),
                          ElevatedButton(
                            onPressed: () => Get.toNamed(Routes.QUIZ_CHALLENGE),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 30),
                              child: Text("KUIS", style: TextStyle(fontSize: 20),),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          ElevatedButton(
                            onPressed: () {
                              controller.isActive.value = true;
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "HUNTING", style: TextStyle(fontSize: 20),),
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                primary: Colors.grey
                            ),
                          ),
                          (controller.isActive.value)
                              ? Text('Fitur belum aktif !')
                              : Container(),
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ),
            Spacer(flex: 2,),
          ],
        ),
      ),
    );
  }
}
