import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squidgame/app/data/model/squid_model.dart';
import 'package:squidgame/app/utils/constant.dart';

class RecommendItemView extends StatelessWidget {
  const RecommendItemView({Key? key, this.func, this.result}) : super(key: key);
  final VoidCallback? func;
  final Result? result;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: func,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 160,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: result?.photos?[0].photoReference != null
                        ? CachedNetworkImage(
                            imageUrl:
                                "${Constants.IMAGE_URL}${result?.photos?[0].photoReference}&key=${Constants.MAP_API_KEY}",
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Transform.scale(
                              scale: 0.5,
                            ),
                          )
                        : Icon(Icons.error),
                  ),
                ),
                Positioned(
                    child: Container(
                        width: 50,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                        child: result?.openingHours?.openNow == 'false'
                            ? Center(child: Text('Tutup'))
                            : Center(child: Text('Buka')),
                    ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 70,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${result?.name}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            fontFamily: 'OpenSans'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('${result?.rating}'),
                      SizedBox(
                        width: 15,
                      ),
                      Icon(
                        Icons.location_on_outlined,
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                          width: Get.width * 0.6,
                          child: Text(
                            '${result?.formattedAddress}',
                            overflow: TextOverflow.ellipsis,
                          )),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
