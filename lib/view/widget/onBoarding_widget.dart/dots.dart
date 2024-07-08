import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:admin/controller/OnBoarding_Controller.dart';
import 'package:admin/core/Constant/Color_Const.dart';
import 'package:admin/data/DataSource/Static/onBoarding_data.dart';

class OnBoardingDots extends StatelessWidget {
  const OnBoardingDots({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingCOntroller());
    return GetBuilder<OnBoardingCOntroller>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onboardingdata.length,
                    (index) => AnimatedContainer(
                          margin: const EdgeInsets.only(right: 5),
                          duration: const Duration(milliseconds: 900),
                          width: controller.currentpage == index ? 20 : 5,
                          height: 6,
                          decoration: BoxDecoration(
                              color: AppColor.primaryColor,
                              borderRadius: BorderRadius.circular(10)),
                        ))
              ],
            ));
  }
}
