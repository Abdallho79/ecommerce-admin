import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:admin/controller/OnBoarding_Controller.dart';
import 'package:admin/core/Constant/Color_Const.dart';
import 'package:admin/data/DataSource/Static/onBoarding_data.dart';

class OnBoardingSlider extends GetView<OnBoardingCOntroller> {
  const OnBoardingSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: Get.height / 1.3,
      width: double.infinity,
      child: Center(
        child: PageView.builder(
            controller: controller.pageController,
            onPageChanged: (value) {
              controller.onChangePage(value);
            },
            itemCount: onboardingdata.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    onboardingdata[index].title!,
                    style: const TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Image.asset(onboardingdata[index].image!),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    onboardingdata[index].body!,
                    style: const TextStyle(
                        fontSize: 17,
                        color: AppColor.grey,
                        fontWeight: FontWeight.w400,
                        height: 2),
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            }),
      ),
    );
  }
}
