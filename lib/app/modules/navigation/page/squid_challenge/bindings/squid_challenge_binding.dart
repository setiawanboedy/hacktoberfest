import 'package:get/get.dart';
import 'package:squidgame/app/modules/navigation/page/squid_challenge/controllers/hunting_challenge_controller.dart';
import 'package:squidgame/app/modules/navigation/page/squid_challenge/controllers/quiz_challenge_controller.dart';


class SquidChallengeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HuntingChallengeController>(
      () => HuntingChallengeController(),
    );
    Get.lazyPut<QuizChallengeController>(
          () => QuizChallengeController(),
    );
  }
}
