import 'package:get/get.dart';
import 'package:squidgame/app/modules/navigation/page/squid_detail/controllers/squid_detail_controller.dart';


class SquidDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SquidDetailController>(
      () => SquidDetailController(),
    );
  }
}
