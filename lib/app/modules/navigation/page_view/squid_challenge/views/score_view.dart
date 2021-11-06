import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScoreView extends StatelessWidget {
  final score = Get.arguments as List;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Score Tantangan'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.blue,
          ),
          Column(
            children: [
              Spacer(flex: 3),
              Text(
                "Jawaban",
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: Colors.white),
              ),
              Spacer(),
               Text(
                "${score[0] ?? 0}/${score[1]}",
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Colors.white),
              ),
              Spacer(),
              Text('Total', style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(color: Colors.white)),
              Spacer(),
              score[0] != null ? Text(
                "${score[0] * 10}",
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Colors.white),
              ) : Text(
                "0",
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Colors.white),
              ),
              Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }
}