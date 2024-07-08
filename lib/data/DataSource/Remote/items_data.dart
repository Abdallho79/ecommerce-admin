import 'dart:io';

import 'package:admin/core/Class/CRUD_Class.dart';
import 'package:admin/linkapi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  viewItems() async {
    var response = await crud.postData(AppLink.itemsview , {});
    return response.fold((l) => l, (r) => r);
  }

  addItems(Map data, File file) async {
    var response =
        await crud.addRequestWithImageOne(AppLink.itemsadd, data, file);
    return response.fold((l) => l, (r) => r);
  }

  editItems(Map data, [File? file]) async {
    var response;
    if (file == null) {
      response = await crud.postData(AppLink.itemsedit, data);
    } else {
      response =
          await crud.addRequestWithImageOne(AppLink.itemsedit, data, file);
    }
    return response.fold((l) => l, (r) => r);
  }

  deleteItems(Map data) async {
    var response = await crud.postData(AppLink.itemsdelete, data);
    return response.fold((l) => l, (r) => r);
  }
}
