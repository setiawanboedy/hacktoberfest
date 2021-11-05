import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProfileView'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: controller.logOut,
          child: Text(
            'Logout',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
