import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:admin/controller/OnBoarding_Controller.dart';
import 'package:admin/core/Constant/Color_Const.dart';

class OnBoardingButton extends GetView<OnBoardingCOntroller> {
  const OnBoardingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      height: 40,
      child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 0),
          textColor: Colors.white,
          onPressed: () {
            controller.next();
          },
          color: AppColor.primaryColor,
          child: Text("Continue")),
    );
  }
}
