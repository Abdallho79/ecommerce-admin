import 'dart:io';

import 'package:admin/controller/categories/viewcat_controller.dart';
import 'package:admin/core/Constant/Routes_Const.dart';
import 'package:admin/core/Functions/uploadFile_Functions.dart';
import 'package:admin/data/DataSource/Remote/categories_data.dart';
import 'package:admin/data/Model/categoriesmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:admin/core/Class/StatusRequest_Class.dart';
import 'package:admin/core/Functions/HandlingDataController_Functions.dart';
import 'package:get/get_navigation/get_navigation.dart';

class EditCatController extends GetxController {
  CategoriesData testData = CategoriesData(Get.find());
  TextEditingController? edit;
  TextEditingController? editar;
  GlobalKey<FormState> key = GlobalKey<FormState>();
  bool isuplood = true;
  StatusRequest statusRequest = StatusRequest.none;
  File? file;
  CategoriesModel? categoriesModel;
  chooseimagegallery() async {
    file = await imageUploadGallery(true);
    update();
  }

  chooseimagecamera() async {
    file = await imageUploadCamera();
    update();
  }

  editData() async {
    statusRequest = StatusRequest.loading;
    Map data = {
      "name": edit!.text,
      "namear": editar!.text,
      "file": categoriesModel!.categoriesImage,
      "id": categoriesModel!.categoriesId
    };
    update();
    var response = await testData.editCategories(data, file);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.offNamed(AppRouts.catview);
        ViewCatController c = Get.find();
        c.getData();
      } else {
        Get.offNamed(AppRouts.catview);
        ViewCatController c = Get.find();
        c.getData();
        statusRequest = StatusRequest.nodatafailure;
      }
    }
    update();
  }

  @override
  void onInit() {
    categoriesModel = Get.arguments["categoriesModel"];
    edit = TextEditingController();
    editar = TextEditingController();
    edit!.text = categoriesModel!.categoriesName!;
    editar!.text = categoriesModel!.categoriesNamaAr!;
    super.onInit();
  }

  @override
  void onClose() {
    edit!.dispose();
    editar!.dispose();
    super.onClose();
  }
}
