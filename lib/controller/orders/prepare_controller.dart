import 'package:admin/core/Class/StatusRequest_Class.dart';
import 'package:admin/core/Functions/HandlingDataController_Functions.dart';
import 'package:admin/core/Services/Services.dart';
import 'package:admin/data/DataSource/Remote/orders/ordersPrepare_data.dart';
// import 'package:admin/data/DataSource/Remote/orders/orderspinding_data.dart';
import 'package:admin/data/model/Orders_model.dart';
import 'package:get/get.dart';

class AcceptedController extends GetxController {
  List<OrdersModel> data = [];
  OrderPrepareData bindingdata = OrderPrepareData(Get.find());
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await bindingdata.getData();
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

  donePrepareOrders(String usersid, String ordersid, String ordertype) async {
    // data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await bindingdata.donePrepareOrder(ordersid, usersid, ordertype);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        getData();
        // List responsebody = response["data"];
        // data.addAll(responsebody.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.none;
      }
    }
    update();
  }

  reFreshOrder() {
    getData();
  }

  String printTypeOrder(String val) {
    if (val == "0") {
      return "delivey";
    } else {
      return "Recicve";
    }
  }

  String printPaymantMethod(String val) {
    if (val == "0") {
      return "Cash";
    } else {
      return "Paymant Card";
    }
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "Await Appoval";
    } else if (val == "1") {
      return "The Order Is Beeing Prepared";
    } else if (val == "2") {
      return "The Order with delivey";
    } else if (val == "3") {
      return "On The Way";
    } else {
      return "Archive";
    }
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
