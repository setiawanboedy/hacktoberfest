import 'package:get/get.dart';

class OptionController extends GetxController{
  var isActive = false.obs;

  int _duration = 0;
  set setDuration(int duration) => this._duration = duration;
  int get getDuration => this._duration;

}