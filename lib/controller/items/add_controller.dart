import 'dart:io';

import 'package:admin/controller/items/view_controller.dart';
import 'package:admin/core/Constant/Routes_Const.dart';
import 'package:admin/core/Functions/uploadFile_Functions.dart';
import 'package:admin/data/DataSource/Remote/categories_data.dart';
import 'package:admin/data/DataSource/Remote/items_data.dart';
import 'package:admin/data/Model/categoriesmodel.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:admin/core/Class/StatusRequest_Class.dart';
import 'package:admin/core/Functions/HandlingDataController_Functions.dart';

class AddItemsController extends GetxController {
  ItemsData testData = ItemsData(Get.find());
  CategoriesData categoriesData = CategoriesData(Get.find());
  List<SelectedListItem> droplist = [];
  TextEditingController? add; // 1
  TextEditingController? addar; // 2
  TextEditingController? desc; // 3
  TextEditingController? descar; // 4
  TextEditingController? count; // 5
  // TextEditingController? active; // 6
  TextEditingController? price; // 7
  TextEditingController? discount; // 8
  TextEditingController? catid; // 9
  TextEditingController? catname; // 10
  // bool isactive = false;
  // String activeVal = "0";
  // switchStatus(bool val) {
  //   isactive = val;
  //   update();
  // }

  GlobalKey<FormState> key = GlobalKey<FormState>();
  bool isuplood = true;
  StatusRequest statusRequest = StatusRequest.none;
  File? file;
  chooseimageGallery() async {
    file = await imageUploadGallery(false);
    update();
  }

  chooseimageCamera() async {
    file = await imageUploadCamera();
    update();
  }

  showOptionImage() {
    showBottomSheetImageOption(chooseimageCamera, chooseimageGallery);
  }

  addData() async {
    if (key.currentState!.validate()) {
      if (catname!.text == "") return Get.snackbar("Error", "Choose category");
      if (file == null) return Get.snackbar("Error", "You must upload image");
      statusRequest = StatusRequest.loading;
      Map data = {
        "name": add!.text,
        "namear": addar!.text,
        "desc": desc!.text,
        "desc_ar": descar!.text,
        "count": count!.text,
        // "active": active!.text,
        "price": price!.text,
        "discount": discount!.text,
        "catid": catid!.text,
      };
      update();
      var response = await testData.addItems(data, file!);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        // Start backend
        if (response['status'] == "success") {
          Get.offNamed(AppRouts.itemview);
          ViewItemsController c = Get.find();
          c.getData();
        } else {
          statusRequest = StatusRequest.nodatafailure;
        }
        // End
      }
      update();
    }
  }

  dataCat() async {
    statusRequest = StatusRequest.loading;

    update();
    var response = await categoriesData.viewCategories();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List databody = response["data"];
        List<CategoriesModel> data = [];
        data.addAll(databody.map((e) => CategoriesModel.fromJson(e)));
        for (int i = 0; i < data.length; i++) {
          droplist.add(SelectedListItem(
              name: data[i].categoriesName!, value: data[i].categoriesId));
        }
      } else {
        statusRequest = StatusRequest.nodatafailure;
      }
    }
    update();
  }

  @override
  void onInit() {
    dataCat();
    add = TextEditingController();
    addar = TextEditingController();
    desc = TextEditingController();
    descar = TextEditingController();
    count = TextEditingController();
    // active = TextEditingController();
    price = TextEditingController();
    discount = TextEditingController();
    catid = TextEditingController();
    catname = TextEditingController();

    super.onInit();
  }

  @override
  void onClose() {
    add!.dispose();
    addar!.dispose();
    desc!.dispose();
    descar!.dispose();
    count!.dispose();
    // active!.dispose();
    price!.dispose();
    discount!.dispose();
    catid!.dispose();
    catname!.dispose();
    super.onClose();
  }

  // showDownList(context) {
  //   DropDownState(
  //     DropDown(
  //       bottomSheetTitle: const Text(
  //         "kCities",
  //         style: TextStyle(
  //           fontWeight: FontWeight.bold,
  //           fontSize: 20.0,
  //         ),
  //       ),
  //       submitButtonChild: const Text(
  //         'Done',
  //         style: TextStyle(
  //           fontSize: 16,
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //       data: ,
  //       selectedItems: (List<dynamic> selectedList) {
  //         List<String> list = [];
  //         for (var item in selectedList) {
  //           if (item is SelectedListItem) {
  //             list.add(item.name);
  //           }
  //         }
  //         // showSnackBar(list.toString());
  //       },
  //       // enableMultipleSelection: true,
  //     ),
  //   ).showModal(context);
  // }
}
