import 'package:get/get.dart';
import 'package:squidgame/app/modules/navigation/page/squid_challenge/controllers/squid_challenge_controller.dart';


class SquidChallengeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SquidChallengeController>(
      () => SquidChallengeController(),
    );
  }
}
