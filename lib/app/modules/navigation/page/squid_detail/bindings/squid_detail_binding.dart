import 'package:get/get.dart';

import '../controllers/squid_detail_controller.dart';

class SquidDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SquidDetailController>(
      () => SquidDetailController(),
    );
  }
}
