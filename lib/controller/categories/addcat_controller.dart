import 'dart:io';

import 'package:admin/controller/categories/viewcat_controller.dart';
import 'package:admin/core/Constant/Routes_Const.dart';
import 'package:admin/core/Functions/uploadFile_Functions.dart';
import 'package:admin/data/DataSource/Remote/categories_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:admin/core/Class/StatusRequest_Class.dart';
import 'package:admin/core/Functions/HandlingDataController_Functions.dart';

class AddCatController extends GetxController {
  CategoriesData testData = CategoriesData(Get.find());
  TextEditingController? add;
  TextEditingController? addar;
  GlobalKey<FormState> key = GlobalKey<FormState>();
  bool isuplood = true;
  StatusRequest statusRequest = StatusRequest.none;
  File? file;
  chooseimage() async {
    file = await imageUploadGallery(true);
    update();
  }

  addData() async {
    if (key.currentState!.validate()) {
      if (file != null) {
        statusRequest = StatusRequest.loading;
        Map data = {
          "name": add!.text,
          "namear": addar!.text,
        };
        update();
        var response = await testData.addCategories(data, file!);
        print("=============================== Controller $response ");
        statusRequest = handlingData(response);
        if (StatusRequest.success == statusRequest) {
          // Start backend
          if (response['status'] == "success") {
            Get.offNamed(AppRouts.catview);
            ViewCatController c = Get.find();
            c.getData();
          } else {
            statusRequest = StatusRequest.nodatafailure;
          }
          // End
        }
        update();
      } else {
        Get.snackbar("Erroe", "You must upload image SVG");
      }
    }
  }

  @override
  void onInit() {
    add = TextEditingController();
    addar = TextEditingController();

    super.onInit();
  }

  @override
  void onClose() {
    add!.dispose();
    addar!.dispose();
    super.onClose();
  }
}
