import 'package:admin/controller/home_controller.dart';
import 'package:admin/core/Constant/ImageAsset_Const.dart';
import 'package:admin/core/Constant/Routes_Const.dart';
import 'package:admin/core/Functions/AlertExitApp_Functions.dart';
import 'package:admin/view/widget/cardadmin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    // ignore: deprecated_member_use
    return WillPopScope(
        onWillPop: alertExitApp,
        child: Scaffold(
          drawer: Drawer(
            child: TextButton.icon(
              onPressed: () {
                controller.logOut();
              },
              label: const Text("LogOut"),
              icon: const Icon(Icons.exit_to_app_outlined),
            ),
          ),
          appBar: AppBar(
            title: const Text("Home"),
          ),
          body: ListView(
            children: [
              GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisExtent: 150),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Cardadmin(
                      image: AppImageAsset.order,
                      title: "Orders",
                      ontap: () {
                        Get.toNamed(AppRouts.orderscreen);
                      }),
                  Cardadmin(
                      image: AppImageAsset.worker,
                      title: "Emploee",
                      ontap: () {}),
                  Cardadmin(
                      image: AppImageAsset.product,
                      title: "Items",
                      ontap: () {
                        Get.toNamed(AppRouts.itemview);
                      }),
                  Cardadmin(
                      image: AppImageAsset.categories,
                      title: "Categories",
                      ontap: () {
                        controller.goToCategories();
                      }),
                  Cardadmin(
                      image: AppImageAsset.email,
                      title: "Emails",
                      ontap: () {}),
                  Cardadmin(
                      image: AppImageAsset.report,
                      title: "Reports",
                      ontap: () {}),
                ],
              )
            ],
          ),
        ));
  }
}
