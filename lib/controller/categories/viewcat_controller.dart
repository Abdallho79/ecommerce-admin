import 'package:admin/core/Constant/Routes_Const.dart';
import 'package:admin/data/DataSource/Remote/categories_data.dart';
import 'package:admin/data/Model/categoriesmodel.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:admin/core/Class/StatusRequest_Class.dart';
import 'package:admin/core/Functions/HandlingDataController_Functions.dart';

class ViewCatController extends GetxController {
  CategoriesData testData = CategoriesData(Get.find());
  List<CategoriesModel> data = [];
  StatusRequest statusRequest = StatusRequest.none;



  deleteData(int index) async {
    Map data1 = {
      "id": data[index].categoriesId,
      "image": data[index].categoriesImage
    };
    await testData.deleteCategories(data1);
    data.removeWhere(
        (element) => element.categoriesId == data[index].categoriesId);
    update();
  }

  goToEdit(CategoriesModel categoriesModel) {
    Get.toNamed(AppRouts.catedit,
        arguments: {"categoriesModel": categoriesModel});
  }

  myBack() {
    Get.offAllNamed(AppRouts.home);
    return Future.value(false);
  }
    getData() async {
    statusRequest = StatusRequest.loading;
    data.clear();
    update();
    var response = await testData.viewCategories();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List databody = response["data"];
        data.addAll(databody.map((e) => CategoriesModel.fromJson(e)));
        // data.addAll(databody.map((e) => CategoriesModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.nodatafailure;
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
