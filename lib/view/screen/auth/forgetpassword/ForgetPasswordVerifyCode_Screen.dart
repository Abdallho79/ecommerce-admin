import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:admin/controller/auth/forgetpassword/ForgetPasswordVerifyCode_Controller.dart';
import 'package:admin/core/Class/HandlingDataView_Class.dart';
import 'package:admin/core/Constant/Color_Const.dart';
import 'package:admin/view/widget/login_widget/maintitle.dart';

class VerifyCodeForgetPaswordScreen extends StatelessWidget {
  const VerifyCodeForgetPaswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordVerifyCodeController codeController =
        Get.put(ForgetPasswordVerifyCodeController());
    return Scaffold(
        backgroundColor: AppColor.backgroundcolor,
        body: GetBuilder<ForgetPasswordVerifyCodeController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: codeController.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.all(15),
                    child: ListView(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        const CoustomTitle(
                            color: AppColor.grey,
                            text: "Verification Code",
                            size: 30,
                            alignmentGeometry: Alignment.center,
                            fontWeight: FontWeight.bold),
                        const SizedBox(
                          height: 30,
                        ),
                        const CoustomTitle(
                            color: Colors.black,
                            text: "Check Code",
                            size: 35,
                            alignmentGeometry: Alignment.center,
                            fontWeight: FontWeight.w600),
                        const SizedBox(
                          height: 30,
                        ),
                        CoustomTitle(
                            color: AppColor.grey2,
                            text:
                                "Please Enter The Digit Code Was Sent To ${controller.email}",
                            size: 15,
                            alignmentGeometry: Alignment.center,
                            fontWeight: FontWeight.w300),
                        const SizedBox(
                          height: 30,
                        ),
                        OtpTextField(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          borderRadius: BorderRadius.circular(15),
                          numberOfFields: 5,
                          borderColor: const Color(0xFF512DA8),
                          //set to true to show as box or false to show as dash
                          showFieldAsBox: true,
                          //runs when a code is typed in
                          onCodeChanged: (String code) {
                            //handle validation or checks here
                          },
                          //runs when every textfield is filled
                          onSubmit: (String verificationCode) {
                            codeController.goToChangePassword(verificationCode);
                          }, // end onSubmit
                        ),
                      ],
                    ),
                  ),
                )));
  }
}
