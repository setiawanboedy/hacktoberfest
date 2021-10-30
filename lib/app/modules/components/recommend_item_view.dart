import 'package:flutter/material.dart';

class RecommendItemView extends StatelessWidget {
  const RecommendItemView({Key? key, this.func}) : super(key: key);
  final VoidCallback? func;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: func,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage('assets/images/sembalun.jpg'),
                    fit: BoxFit.fitWidth
                ),
              ),

            ),
            Container(
              width: double.infinity,
              height: 60,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Sembalun', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, fontFamily: 'OpenSans'),),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.access_time, size: 20,),
                      SizedBox(width: 5,),
                      Text('45 menit'),
                      SizedBox(width: 15,),
                      Icon(Icons.location_on_outlined, size: 20,),
                      SizedBox(width: 5,),
                      Text('Jln sembalun'),
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
