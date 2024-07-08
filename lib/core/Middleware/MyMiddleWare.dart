import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:admin/core/Constant/Routes_Const.dart';
import 'package:admin/core/Services/Services.dart';

class MyMiddaleWare extends GetMiddleware {
  @override
  int? get priority => 1;
  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("step") == "2") {
      return RouteSettings(name: AppRouts.home);
    }
    if (myServices.sharedPreferences.getString("step") == "1") {
      return RouteSettings(name: AppRouts.logIn);
    }
    return null;
  }
}
