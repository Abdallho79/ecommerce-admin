import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:admin/controller/auth/forgetpassword/ForgetPasswordEmail_Controller.dart';
import 'package:admin/core/shared/CoustomButtonLimited_Class.dart';
import 'package:admin/core/shared/CoustomTextFormFieldd_Class.dart';
import 'package:admin/core/Class/HandlingDataView_Class.dart';
import 'package:admin/core/Constant/Color_Const.dart';
import 'package:admin/core/Functions/ValidInput_Functions.dart';
import 'package:admin/view/widget/login_widget/maintitle.dart';

class ForgetPasswordEmailScreen extends StatelessWidget {
  const ForgetPasswordEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordEmailController());
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      body: GetBuilder<ForgetPasswordEmailController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding: const EdgeInsets.all(15),
                child: Form(
                  key: controller.formstate,
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const CoustomTitle(
                          color: AppColor.grey,
                          text: "Enter Your Email",
                          size: 30,
                          alignmentGeometry: Alignment.center,
                          fontWeight: FontWeight.bold),
                      const SizedBox(
                        height: 30,
                      ),
                      const CoustomTitle(
                          color: AppColor.grey2,
                          text: "Enter Your Email To Send Digit Code",
                          size: 15,
                          alignmentGeometry: Alignment.center,
                          fontWeight: FontWeight.w300),
                      const SizedBox(
                        height: 30,
                      ),
                      CoustomTextFormAuth(
                        hinttext: "Enter Your Email",
                        labeltext: "Email",
                        iconData: Icons.email_outlined,
                        mycontroller: controller.email,
                        valid: (val) {
                          return validInput("email", val!, 5, 50);
                        },
                        isNumber: false,
                      ),
                      CoustomButton(
                        text: "Confrim",
                        paddinglenth: 80,
                        width: 100,
                        onPressed: () {
                          controller.goToForgetPasswordVerifyCode();
                        },
                      )
                    ],
                  ),
                ),
              ))),
    );
  }
}
