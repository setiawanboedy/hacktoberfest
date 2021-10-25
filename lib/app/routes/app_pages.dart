import 'package:get/get.dart';

import 'package:squidgame/app/modules/explore/bindings/explore_binding.dart';
import 'package:squidgame/app/modules/explore/views/explore_view.dart';
import 'package:squidgame/app/modules/home/bindings/home_binding.dart';
import 'package:squidgame/app/modules/home/views/home_view.dart';
import 'package:squidgame/app/modules/login/bindings/login_binding.dart';
import 'package:squidgame/app/modules/login/views/login_view.dart';
import 'package:squidgame/app/modules/profile/bindings/profile_binding.dart';
import 'package:squidgame/app/modules/profile/views/profile_view.dart';
import 'package:squidgame/app/modules/register/bindings/register_binding.dart';
import 'package:squidgame/app/modules/register/views/register_view.dart';
import 'package:squidgame/app/modules/splash/bindings/splash_binding.dart';
import 'package:squidgame/app/modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const HOME = Routes.HOME;
  static const LOGIN = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.EXPLORE,
      page: () => ExploreView(),
      binding: ExploreBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
  ];
}
