import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingHome extends StatelessWidget {
  const LoadingHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        reverse: true,
        itemBuilder: (context, index){
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Container(
                  height: 160,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 70,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                        width: Get.width * 0.5,
                        height: 20,
                        decoration: BoxDecoration(
                            color: Colors.grey
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }, separatorBuilder: (context, index){
      return SizedBox(height: 10,);
    }, itemCount: 3);
  }
}
