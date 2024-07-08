import 'dart:io';

import 'package:admin/controller/items/view_controller.dart';
import 'package:admin/core/Constant/Routes_Const.dart';
import 'package:admin/core/Functions/uploadFile_Functions.dart';
import 'package:admin/data/DataSource/Remote/items_data.dart';
import 'package:admin/data/Model/itemsmodel.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:admin/core/Class/StatusRequest_Class.dart';
import 'package:admin/core/Functions/HandlingDataController_Functions.dart';

class EditItemsController extends GetxController {
  ItemsData testData = ItemsData(Get.find());
  TextEditingController? edit; // 1
  TextEditingController? editar; // 2
  TextEditingController? desc; // 3
  TextEditingController? descar; // 4
  TextEditingController? count; // 5
  TextEditingController? price; // 7
  TextEditingController? discount; // 8
  TextEditingController? catid; // 9
  TextEditingController? catname; // 10
  String? active;
  GlobalKey<FormState> key = GlobalKey<FormState>();
  bool isuplood = true;
  StatusRequest statusRequest = StatusRequest.none;
  File? file;
  ItemsModel? itemsModel;
  List<SelectedListItem> droplist = [];
  List<ItemsModel> alldata = [];

  changeActive(val) {
    active = val;
    update();
  }

  chooseimagegallery() async {
    file = await imageUploadGallery(false);
    update();
  }

  chooseimagecamera() async {
    file = await imageUploadCamera();
    update();
  }

  showOptionImage() {
    showBottomSheetImageOption(chooseimagecamera, chooseimagegallery);
  }

  editData() async {
    statusRequest = StatusRequest.loading;
    Map data = {
      "name": edit!.text,
      "namear": editar!.text,
      "desc": desc!.text,
      "desc_ar": descar!.text,
      "count": count!.text,
      "active": active!,
      "price": price!.text,
      "discount": discount!.text,
      "catid": catid!.text,
      "file": itemsModel!.itemsImage,
      "itemsid": itemsModel!.itemsId
    };
    update();
    var response = await testData.editItems(data, file);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.offNamed(AppRouts.itemview);
        ViewItemsController c = Get.find();
        c.getData();
      } else {
        Get.offNamed(AppRouts.itemview);
        ViewItemsController c = Get.find();
        c.getData();
        statusRequest = StatusRequest.nodatafailure;
      }
    }
    update();
  }

  @override
  void onInit() {
    itemsModel = Get.arguments["itemsmodel"];
    // alldata = Get.arguments["catname"];
    // List<ItemsModel> data1 = [];

    // for (int i = 0; i < data1.length; i++) {
    //   print("====================================");
    //   print(data1[i].categoriesName!);
    //   print("====================================");
    //   droplist.add(SelectedListItem(
    //       name: data1[i].categoriesName!, value: data1[i].categoriesId));
    // }
    edit = TextEditingController();
    editar = TextEditingController();
    desc = TextEditingController();
    descar = TextEditingController();
    count = TextEditingController();

    price = TextEditingController();
    discount = TextEditingController();
    catid = TextEditingController();
    catname = TextEditingController();
    //
    edit!.text = itemsModel!.itemsName!;
    editar!.text = itemsModel!.categoriesNamaAr!;
    desc!.text = itemsModel!.itemsDesc!;
    descar!.text = itemsModel!.itemsDescAr!;
    count!.text = itemsModel!.itemsCount!;
    active = itemsModel!.itemsActive!;
    price!.text = itemsModel!.itemsPrice!;
    discount!.text = itemsModel!.itemsDiscount!;
    catid!.text = itemsModel!.categoriesId!;
    catname!.text = itemsModel!.categoriesName!;
    super.onInit();
  }

  @override
  void onClose() {
    edit!.dispose();
    editar!.dispose();
    desc!.dispose();
    descar!.dispose();
    count!.dispose();
    price!.dispose();
    discount!.dispose();
    catid!.dispose();
    catname!.dispose();
    super.onClose();
  }
}
