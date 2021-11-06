import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squidgame/app/data/model/marker_model.dart';
import 'package:squidgame/app/routes/app_pages.dart';

class ItemChallenge extends StatelessWidget {
  const ItemChallenge({
    Key? key,
    required this.challenge,
    this.onPageChanged,
    this.index,
    this.distance,
  }) : super(key: key);

  final List<Result>? challenge;
  final ValueChanged<int>? onPageChanged;
  final int? index;
  final List<double>? distance;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 68.0),
        child: SizedBox(
          height: Get.width * 0.3, // card height
          child: challenge?.length != 0
              ? PageView.builder(
                  itemCount: challenge?.length,
                  controller: PageController(viewportFraction: 0.9),
                  onPageChanged: onPageChanged,
                  itemBuilder: (_, i) {
                    return Transform.scale(
                      scale: i == index ? 1 : 0.9,
                      child: Container(
                        height: Get.width * 0.3,
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0.5, 0.5),
                              color: Color(0xff000000).withOpacity(0.12),
                              blurRadius: 20,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () => Get.offNamed(Routes.OPTIONS_CHALLENGE,
                                arguments: challenge?[i]),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 9, top: 7, bottom: 7, right: 9),
                                  child: Container(
                                    height: 94.0,
                                    width: 94.0,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: challenge != null
                                          ? CachedNetworkImage(
                                              imageUrl:
                                                  "${challenge?[i].image}",
                                              fit: BoxFit.cover,
                                              placeholder: (context, url) =>
                                                  Transform.scale(
                                                scale: 0.5,
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            )
                                          : Icon(Icons.error),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12, right: 0.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Wrap(
                                            alignment: WrapAlignment.start,
                                            spacing: 2,
                                            direction: Axis.vertical,
                                            children: [
                                              Container(
                                                width: Get.width * 0.4,
                                                child: Text(
                                                  challenge?[i].name ?? 'loading',
                                                  style: TextStyle(
                                                    fontFamily: "OpenSans",
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff000000),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                width: Get.width * 0.4,
                                                child: Text(
                                                  "Point: ${challenge?[i].point}",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    fontFamily: "OpenSans",
                                                    fontSize: 15,
                                                    color: Color(0xff000000),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 2,
                                              ),
                                              Container(
                                                width: Get.width * 0.4,
                                                child: Text(
                                                  'Durasi: ${challenge?[i].time} Detik',
                                                  overflow: TextOverflow.clip,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Color(0xff000000),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      Container(
                                        width: 50,
                                        height: 45,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.green),
                                        child: Center(
                                          child: Text(
                                            '${challenge?[i].status}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )
              : Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 100,
                width: Get.width * 0.8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Challenge tidak dapat di jangkau \n Silahkan kunjungi salah satu destinasi wisata !',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
        ),
      ),
    );
  }
}
