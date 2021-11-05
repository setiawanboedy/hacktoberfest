import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:squidgame/app/modules/components/custom_button.dart';
import 'package:squidgame/app/modules/components/custom_textfiel.dart';
import 'package:squidgame/app/utils/helpers.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    final formKeyRegister = GlobalKey<FormState>();
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
                  child: Form(
                    key: formKeyRegister,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Daftar',
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
                          text: 'Nama Lengkap',
                          hint: 'Nama Lengkap Anda',
                          icon: Icons.person,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        CustomTextField(
                          controller: controller.emailC,
                          text: 'Email',
                          hint: 'Email Anda',
                          icon: Icons.email,
                          keyboardType: TextInputType.emailAddress,
                          validator: validateEmail,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        CustomTextField(
                          controller: controller.passwordC,
                          text: 'Password',
                          hint: 'Password Anda',
                          icon: Icons.lock_rounded,
                            validator: validatePassword,
                          isPassword: true,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        CustomTextField(
                          controller: controller.confirmPasswordC,
                          text: 'Konfirmasi Password',
                          hint: 'Konfirmasi Password Anda',
                          icon: Icons.lock_rounded,
                          validator: (value){
                            if (controller.passwordC.text != value) {
                              return 'Password tidak cocok';
                            } else if (value?.length == 0) {
                              return 'Konfirmasi password diperlukan';
                            } else {
                              return null;
                            }
                          },
                          isPassword: true,
                        ),
                        CustomButton(
                          text: 'DAFTAR',
                          func: () {
                            if(formKeyRegister.currentState!.validate()){
                              controller.register();
                            }
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Sudah punya akun?',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextButton(
                              onPressed: () => Get.back(),
                              child: Text(
                                'Masuk',
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
