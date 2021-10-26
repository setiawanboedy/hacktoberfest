import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:squidgame/app/modules/components/custom_button.dart';
import 'package:squidgame/app/modules/components/custom_textfiel.dart';
import 'package:squidgame/app/routes/app_pages.dart';
import 'package:squidgame/app/utils/helpers.dart';
import 'package:squidgame/app/utils/style.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {

  @override
  Widget build(BuildContext context) {
    final formKeyLogin = GlobalKey<FormState>();
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
                    vertical: 120.0,
                  ),
                  child: Form(
                    key: formKeyLogin,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 30.0),
                        CustomTextField(
                          controller: controller.emailC,
                          text: 'Email',
                          hint: 'Enter Email Address',
                          icon: Icons.email,
                          keyboardType: TextInputType.emailAddress,
                          validator: validateEmail,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        CustomTextField(
                          controller: controller.passwordC,
                          text: 'Password',
                          hint: 'Enter Password',
                          isPassword: true,
                          icon: Icons.lock_rounded,
                          validator: validatePassword,
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () => print('Forgot Password Button Pressed'),
                            child: Text(
                              'Forgot Password?',
                              style: kLabelStyle,
                            ),
                          ),
                        ),
                        CustomButton(
                          text: 'LOGIN',
                          func: () {
                            if(formKeyLogin.currentState!.validate()){
                              controller.login();
                              print('LOGIN');
                            }
                            },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an Account?',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextButton(
                              onPressed: () => Get.toNamed(Routes.REGISTER),
                              child: Text(
                                'Sign Up',
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
