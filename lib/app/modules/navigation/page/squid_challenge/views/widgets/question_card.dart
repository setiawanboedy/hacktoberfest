import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squidgame/app/data/model/question_model.dart';
import 'package:squidgame/app/modules/navigation/page/squid_challenge/controllers/quiz_challenge_controller.dart';

import 'option.dart';


class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    // it means we have to pass this
     this.question,
  }) : super(key: key);
  final Questions? question;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizChallengeController>(
      init: QuizChallengeController(),
        builder: (controller) {
      return Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Column(
          children: [
            Text(
              "${question?.question}",
              style: Theme
                  .of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.black45),
            ),
            SizedBox(height: 10 / 2),
            ...List.generate(
              question?.options?.length ?? 0,
                  (index) =>
                  Option(
                    index: index,
                    text: "${question?.options?[index]}",
                    press: () => controller.checkAns(question, index),
                  ),
            ),
          ],
        ),
      );
    });
  }
}