import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:admin/core/Class/StatusRequest_Class.dart';
import 'package:admin/core/Constant/Routes_Const.dart';
import 'package:admin/core/Functions/HandlingDataController_Functions.dart';
import 'package:admin/data/DataSource/Remote/SignUp_data.dart';

class SignUpController extends GetxController {
  TextEditingController? email;
  TextEditingController? phone;
  TextEditingController? name;
  TextEditingController? password;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool dontshowpasword = true;
  StatusRequest statusRequest = StatusRequest.none;
  SignUpData signUpData = SignUpData(Get.find());

  showPassword() {
    dontshowpasword = dontshowpasword == true ? false : true;
    update();
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    name = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }

  goToVerifyCode() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      var response = await signUpData.insertData(
          email!.text, phone!.text, name!.text, password!.text);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          Get.snackbar("Success", "Enter VerifyCode",
              duration: Duration(seconds: 8));
          Get.toNamed(AppRouts.verifyCodeSignUp, arguments: {
            "email": email!.text,
          });
        } else {
          Get.snackbar("Failure",
              "There are an account with the smae email or phone number");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  goToLogin() {
    Get.offAllNamed(AppRouts.logIn);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    email!.dispose();
    password!.dispose();
    name!.dispose();
    phone!.dispose();
    super.dispose();
  }
}
