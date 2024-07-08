import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:admin/core/shared/CoustomButtonLimited_Class.dart';
import 'package:admin/core/Constant/Color_Const.dart';
import 'package:admin/core/Constant/Routes_Const.dart';
import 'package:admin/core/Functions/AlertExitApp_Functions.dart';
import 'package:admin/core/Localization/language_Controller.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LanguageController controller = Get.find();
    return Scaffold(
      body: WillPopScope(
          onWillPop: alertExitApp,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "3".tr,
                  style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: AppColor.grey),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CoustomButton(
                text: "1".tr,
                paddinglenth: 20,
                width: 200,
                onPressed: () {
                  controller.changeLang("en");

                  Get.offAllNamed(AppRouts.onBoarding);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CoustomButton(
                text: "2".tr,
                paddinglenth: 20,
                width: 200,
                onPressed: () {
                  controller.changeLang("ar");

                  Get.offAllNamed(AppRouts.onBoarding);
                },
              )
            ],
          )),
    );
  }
}
