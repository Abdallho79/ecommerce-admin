import 'package:admin/core/Class/StatusRequest_Class.dart';
import 'package:admin/core/Functions/HandlingDataController_Functions.dart';
import 'package:admin/core/services/services.dart';
import 'package:admin/data/DataSource/Remote/orders/ordersArchive_data.dart';
import 'package:admin/data/model/Orders_model.dart';
import 'package:admin/view/screen/orders/archive.dart';
import 'package:get/get.dart';

class ArchiveController extends GetxController {
  List<OrdersModel> data = [];
  OrdersArchiveData archivedata = OrdersArchiveData(Get.find());
  late StatusRequest statusRequest;

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await archivedata.orderArchive();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsebody = response["data"];
        data.addAll(responsebody.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.none;
      }
    }
    update();
  }

  refreshorder() {
    getData();
  }

  String printTypeOrder(String val) {
    if (val == "0") {
      return "delivery";
    } else {
      return "Recicve";
    }
  }

  String printPaymantMethod(String val) {
    if (val == "0") {
      return "Cash On Delivery";
    } else {
      return "Paymant Card";
    }
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
