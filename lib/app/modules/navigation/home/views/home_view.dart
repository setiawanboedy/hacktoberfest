import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squidgame/app/modules/components/recommend_item_view.dart';
import 'package:squidgame/app/routes/app_pages.dart';
import 'package:squidgame/app/utils/style.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 130 + MediaQuery.of(context).viewPadding.top,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color(0xFF398AE5),
                              Color(0xFF61A4F1),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 100,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(
                              15.0 + MediaQuery.of(context).viewPadding.top),
                          child: Center(
                            child: Text(
                              "Good Afternoon",
                              style: kLabelStyle,
                            ),
                          ),
                        ),
                        Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Reward Points",
                                    ),
                                    Spacer(),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Text("Tukarkan",),
                                    ),
                                    SizedBox(width: 10),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 5),
                                        color: Colors.grey[300],
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          size: 15,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Divider(
                                  thickness: 1,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('500', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
                                    SizedBox(width: 5,),
                                    Text('pts', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text('Rekomendasi Wisata'),
                  Text('Selengkapnya', style: TextStyle(color: Colors.black45),)
                ],),
              ),
              Container(
                height: Get.height,
                width: double.infinity,
                child: controller.obx((state) => ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    reverse: true,
                    itemBuilder: (context, index){
                    state?.results?.sort((b, a) => a.openingHours!.openNow!.compareTo(b.openingHours!.openNow!));
                      return RecommendItemView(
                        result: state?.results?[index],
                        func: () => Get.toNamed(Routes.SQUID_DETAIL, arguments: state?.results?[index].placeId),
                      );
                    }, separatorBuilder: (context, index){
                  return SizedBox(height: 10,);
                }, itemCount: state?.results?.length ?? 3)),
              ),
            ],
          ),
        )
    );
  }
}
