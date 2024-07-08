import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:admin/core/Constant/Routes_Const.dart';
import 'package:admin/core/Services/Services.dart';
import 'package:admin/data/DataSource/Static/onBoarding_data.dart';

class OnBoardingCOntroller extends GetxController {
  PageController? pageController;
  MyServices myServices = Get.find();
  int currentpage = 0;

  next() {
    currentpage++;
    if (currentpage == onboardingdata.length) {
      myServices.sharedPreferences.setString("step", "1");
      Get.offAllNamed(AppRouts.logIn);
    } else {
      pageController!.animateToPage(currentpage,
          duration: Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  onChangePage(int index) {
    currentpage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
