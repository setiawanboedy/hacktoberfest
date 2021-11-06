import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squidgame/app/modules/components/recommend_item_view.dart';
import 'package:squidgame/app/modules/navigation/page_view/see_all/views/widgets/custom_appbar.dart';
import 'package:squidgame/app/routes/app_pages.dart';

import '../controllers/see_all_controller.dart';

class SeeAllView extends GetView<SeeAllController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Selengkapnya',
          onChanged: (text) {
            controller.searchSquid(text);
          },
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Obx(() {
                if (controller.searchResult.results != null &&
                    controller.searchResult.results?.length != 0) {
                  return ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      reverse: true,
                      itemBuilder: (context, index) {
                        controller.searchResult.results?.sort((b, a) => a
                            .openingHours!.openNow!
                            .compareTo(b.openingHours!.openNow!));
                        return RecommendItemView(
                          result: controller.searchResult.results?[index],
                          func: () => Get.toNamed(Routes.SQUID_DETAIL,
                              arguments: controller
                                  .searchResult.results?[index].placeId),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 10,
                        );
                      },
                      itemCount: controller.searchResult.results?.length ?? 3);
                } else {
                  return controller.squidModel.obx((squidModel) {
                    return ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        reverse: true,
                        itemBuilder: (context, index) {
                          squidModel?.results?.sort((b, a) => a
                              .openingHours!.openNow!
                              .compareTo(b.openingHours!.openNow!));
                          return RecommendItemView(
                            result: squidModel?.results?[index],
                            func: () => Get.toNamed(Routes.SQUID_DETAIL,
                                arguments: squidModel?.results?[index].placeId),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 10,
                          );
                        },
                        itemCount: squidModel?.results?.length ?? 3);
                  });
                }
              })
            ],
          ),
        ));
  }
}
