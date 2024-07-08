import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:admin/controller/auth/forgetpassword/ForgetPasswordSuccess_Controller.dart';
import 'package:admin/core/shared/CoustomButtonLimited_Class.dart';
import 'package:admin/core/Constant/Color_Const.dart';
import 'package:admin/view/widget/login_widget/maintitle.dart';

class ForgetPasswordSuccessScreen extends StatelessWidget {
  const ForgetPasswordSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordSuccessController controller =
        Get.put(ForgetPasswordSuccessController());
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundcolor,
        centerTitle: true,
        elevation: 0.0,
        title: const Text(
          "Success",
          style: TextStyle(
              color: AppColor.grey, fontSize: 15, fontWeight: FontWeight.w400),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          const CoustomTitle(
              color: Colors.black,
              text: "You Can Login Now",
              size: 20,
              alignmentGeometry: Alignment.center,
              fontWeight: FontWeight.bold),
          const Center(
              child: Icon(
            Icons.check_circle_outline,
            size: 250,
            color: AppColor.primaryColor,
          )),
          const Spacer(),
          SizedBox(
              width: double.infinity,
              child: CoustomButton(
                text: "Login Now",
                paddinglenth: 20,
                width: 100,
                onPressed: () {
                  controller.goToLogin();
                },
              )),
          const SizedBox(height: 30)
        ]),
      ),
    );
  }
}
