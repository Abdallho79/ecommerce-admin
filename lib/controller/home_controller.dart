import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:admin/core/Class/StatusRequest_Class.dart';
import 'package:admin/core/Constant/Routes_Const.dart';
import 'package:admin/core/Services/Services.dart';

class HomeController extends GetxController {
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.success;
  logOut() {
    FirebaseMessaging.instance.unsubscribeFromTopic("admin");
    FirebaseMessaging.instance.unsubscribeFromTopic(
        "admin${myServices.sharedPreferences.getString("id")}");
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRouts.logIn);
  }

  goToCategories() {
    print("============================A=======================");
    Get.toNamed(AppRouts.catview);
    print("============================B=======================");
  }
}
