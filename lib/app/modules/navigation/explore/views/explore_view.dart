import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:squidgame/app/modules/components/squid_item_view.dart';
import 'package:squidgame/app/routes/app_pages.dart';

import '../controllers/explore_controller.dart';

class ExploreView extends GetView<ExploreController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore', style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: GridView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 5 / 6,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemCount: 10,
            itemBuilder: (BuildContext ctx, index) {
              return SquidItemView(
                func: ()=> Get.toNamed(Routes.SQUID_DETAIL, arguments: null),
              );
            }),
      ),
    );
  }
}
