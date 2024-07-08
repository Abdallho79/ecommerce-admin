import 'package:admin/core/Class/CRUD_Class.dart';
import 'package:admin/linkapi.dart';

class OrderPrepareData {
  Crud crud;
  OrderPrepareData(this.crud);
  getData() async {
    var response =
        await crud.postData(AppLink.preparevieworders, {});
    return response.fold((l) => l, (r) => r);
  }

  donePrepareOrder(String ordersid, String usersid, String ordertype) async {
    var response = await crud.postData(AppLink.prepareorders,
        {"ordersid": ordersid, "usersid": usersid, "ordertype": ordertype});
    return response.fold((l) => l, (r) => r);
  }

  // doneOrder(String ordersid, String usersid) async {
  //   var response = await crud.postData(AppLink.doneprepareorders,
  //       {"ordersid": ordersid, "usersid": usersid});
  //   return response.fold((l) => l, (r) => r);
  // }
}
