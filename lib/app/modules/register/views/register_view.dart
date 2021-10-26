import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:squidgame/app/modules/components/custom_button.dart';
import 'package:squidgame/app/modules/components/custom_textfiel.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF73AEF5),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 80.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      CustomTextField(
                        controller: controller.nameC,
                        text: 'Full Name',
                        hint: 'Enter your name',
                        icon: Icons.person,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      CustomTextField(
                        controller: controller.emailC,
                        text: 'Email',
                        hint: 'Enter Email Address',
                        icon: Icons.email,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      CustomTextField(
                        controller: controller.passwordC,
                        text: 'Password',
                        hint: 'Enter Password',
                        icon: Icons.lock_rounded,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      CustomTextField(
                        controller: controller.confirmPasswordC,
                        text: 'Confirm Password',
                        hint: 'Confirm Password',
                        icon: Icons.lock_rounded,
                      ),
                      CustomButton(
                        text: 'REGISTER',
                        func: () {
                          controller.register();
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'I have an Account?',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextButton(
                            onPressed: () => Get.back(),
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
