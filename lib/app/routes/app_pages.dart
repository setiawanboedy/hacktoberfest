import 'package:get/get.dart';

import 'package:squidgame/app/modules/login/bindings/login_binding.dart';
import 'package:squidgame/app/modules/login/views/login_view.dart';
import 'package:squidgame/app/modules/navigation/page/squid_detail/bindings/squid_detail_binding.dart';
import 'package:squidgame/app/modules/navigation/page/squid_detail/views/squid_detail_view.dart';
import 'package:squidgame/app/modules/register/bindings/register_binding.dart';
import 'package:squidgame/app/modules/register/views/register_view.dart';
import 'package:squidgame/app/modules/splash/bindings/splash_binding.dart';
import 'package:squidgame/app/modules/splash/views/splash_view.dart';
import 'package:squidgame/app/utils/bottom_navigation.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const NAVIGATION = Routes.NAVIGATION;
  static const LOGIN = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.NAVIGATION,
      page: () => BottomNavigation(),
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
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.SQUID_DETAIL,
      page: () => SquidDetailView(),
      binding: SquidDetailBinding(),
    ),
  ];
}
