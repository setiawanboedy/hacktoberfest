import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:squidgame/app/data/model/squid_model.dart';
class SquidItemView extends StatelessWidget {
  const SquidItemView({
    Key? key,
    this.func,
  }) : super(key: key);

  final VoidCallback? func;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: func,
      child: Card(
        elevation: 4,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          height: 200,
          width: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 160,
                height: 130,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                  child:
                  // squid?.imageUrl != null ? CachedNetworkImage(
                  //   imageUrl: "${squid?.imageUrl}",
                  //   fit: BoxFit.fill,
                  //   placeholder: (context, url) => Transform.scale(
                  //     scale: 0.5,
                  //     child: CircularProgressIndicator(),
                  //   ),
                  // ):
                  Image.asset('assets/images/sembalun.jpg', fit: BoxFit.fill,),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sembalun",
                          maxLines: 1,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "roboto",
                          ),
                        ),
                        Icon(Icons.location_on_outlined)
                      ],
                    ),
                    Text('Distance 1 km', style: TextStyle(fontWeight: FontWeight.w600),)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}