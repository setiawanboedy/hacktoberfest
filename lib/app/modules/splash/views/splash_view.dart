import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(builder: (_) => Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    ));
  }
}
