import 'package:get/get.dart';
import 'package:squidgame/app/modules/navigation/page_view/squid_challenge/controllers/option_controller.dart';

class SquidChallengeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OptionController>(
          () => OptionController(),
    );
  }
}
