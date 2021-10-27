import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          return Text('${controller.user.name}');
        }),
        centerTitle: true,
      ),
      body: Center(
          child: ElevatedButton(
            onPressed: () => controller.logOut(), child: Text('sign out'),)
      ),
    );
  }
}
