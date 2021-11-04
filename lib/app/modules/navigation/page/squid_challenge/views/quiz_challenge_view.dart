import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squidgame/app/data/model/marker_model.dart';
import 'package:squidgame/app/modules/navigation/page/squid_challenge/controllers/quiz_challenge_controller.dart';
import 'package:squidgame/app/modules/navigation/page/squid_challenge/views/widgets/progress_bar.dart';
import 'package:squidgame/app/modules/navigation/page/squid_challenge/views/widgets/question_card.dart';

class QuizChallengeView extends StatelessWidget {
  final quiz = Get.arguments as Result;

  @override
  Widget build(BuildContext context) {
    QuizChallengeController controller = Get.put(QuizChallengeController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(onPressed: controller.nextQuestion,
              child: Text("Skip", style: TextStyle(color: Colors.white),)),
        ],
      ),
      body: Stack(
        children: [
          Container(width: double.infinity,
            height: double.infinity,
            color: Colors.blue,),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10),
                  child: ProgressBar(),
                ),
                SizedBox(height: 10),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10),
                  child: Obx(() {
                    return Text.rich(
                      TextSpan(
                        text:
                        "Question ${controller.questionNumber.value}",
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: Colors.white),
                        children: [
                          TextSpan(
                            text: "/${controller.questions.length}",
                            style: Theme
                                .of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Colors.black45),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
                Divider(thickness: 1.5, color: Colors.black45,),
                SizedBox(height: 10),
                Expanded(
                  child: PageView.builder(
                    // Block swipe to next qn
                    physics: NeverScrollableScrollPhysics(),
                    controller: controller.pageController,
                    onPageChanged: controller.updateQnNumber,
                    itemCount: controller.questions.length,
                    itemBuilder: (context, index) =>
                        QuestionCard(
                            question: controller.questions[index]),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
