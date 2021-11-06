import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingDetail extends StatelessWidget {
  const LoadingDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Get.height * 0.45,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20))
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
                  Container(
                    width: Get.width * 0.6,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.grey
                    ),
                  ),
                  Container(
                    width: Get.width * 0.3,
                    height: 20,
                    decoration: BoxDecoration(
                        color: Colors.grey
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: Get.width * 0.4,
                    height: 20,
                    decoration: BoxDecoration(
                        color: Colors.grey
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: Get.width * 0.2,
                    height: 20,
                    decoration: BoxDecoration(
                        color: Colors.grey
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: Get.width * 0.4,
                    height: 20,
                    decoration: BoxDecoration(
                        color: Colors.grey
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: Get.width * 0.4,
                    height: 20,
                    decoration: BoxDecoration(
                        color: Colors.grey
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: Get.width * 0.2,
                    height: 20,
                    decoration: BoxDecoration(
                        color: Colors.grey
                    ),
                  ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: Get.height * 0.2,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15)),
              ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
