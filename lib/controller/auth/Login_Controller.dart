import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:admin/core/Class/StatusRequest_Class.dart';
import 'package:admin/core/Constant/Routes_Const.dart';
import 'package:admin/core/Functions/HandlingDataController_Functions.dart';
import 'package:admin/core/Services/Services.dart';
import 'package:admin/data/DataSource/Remote/login_data.dart';

class LoginController extends GetxController {
  TextEditingController? email;
  TextEditingController? password;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  MyServices myServices = Get.find();
  bool dontshowpasword = true;
  LoginData loginData = LoginData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List data = [];

  getData() async {}

  showPassword() {
    dontshowpasword = dontshowpasword == true ? false : true;
    update();
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  goToHome() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.checkData(email!.text, password!.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          print("===========${response}===========");
          if (response["data"]["admin_approve"].toString() == "1") {
            myServices.sharedPreferences
                .setString("id", response["data"]["admin_id"].toString());
            String id = myServices.sharedPreferences.getString("id")!;
            myServices.sharedPreferences
                .setString("email", response["data"]["admin_email"].toString());
            myServices.sharedPreferences
                .setString("phone", response["data"]["admin_phone"].toString());
            myServices.sharedPreferences.setString(
                "password", response["data"]["admin_password"].toString());
            myServices.sharedPreferences
                .setString("name", response["data"]["admin_name"].toString());
            myServices.sharedPreferences.setString("step", "2");
            FirebaseMessaging.instance.subscribeToTopic("admin");
            FirebaseMessaging.instance.subscribeToTopic("admin${id}");
            Get.offAllNamed(AppRouts.home);
          } else {
            Get.snackbar("Error", "Please Verify Your Account");
            Get.toNamed(AppRouts.verifyCodeSignUp,
                arguments: {"email": email!.text});
          }
        } else {
          Get.snackbar("Error", "email or password not found");
          statusRequest = StatusRequest.nodatafailure;
        }
      }
      update();
    }
  }

  // goToSignUp() {
  //   Get.offAllNamed(AppRouts.signUp);
  // }

  goToForgetPassword() {
    Get.toNamed(AppRouts.forgetPassword);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    email!.dispose();
    password!.dispose();
    super.dispose();
  }
}
