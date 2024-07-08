import 'package:get/get.dart';
import 'package:admin/core/Constant/Routes_Const.dart';

class SignUpSuccessController extends GetxController {
  goToLogin() {
    Get.offAllNamed(AppRouts.logIn);
  }
}
