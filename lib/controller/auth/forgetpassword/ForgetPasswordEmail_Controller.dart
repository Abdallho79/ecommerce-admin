import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:admin/core/Class/StatusRequest_Class.dart';
import 'package:admin/core/Constant/Routes_Const.dart';
import 'package:admin/core/Functions/HandlingDataController_Functions.dart';
import 'package:admin/data/DataSource/Remote/forgetpassword_data/checkemail_data.dart';

class ForgetPasswordEmailController extends GetxController {
  TextEditingController? email;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  CheckEmailData checkEmailData = CheckEmailData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    email = TextEditingController();
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    email!.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  goToForgetPasswordVerifyCode() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      var response = await checkEmailData.CheckData(email!.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRouts.verifyCodeForgetPassword,
              arguments: {"email": email!.text});
        } else {
          Get.snackbar("Failure", "Email doesn't exist");
          statusRequest = StatusRequest.nodatafailure;
        }
        // End
      } else {
        print("==================${email!.text}================");
      }
      update();
    }
  }
}
