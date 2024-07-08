import 'package:admin/core/Class/CRUD_Class.dart';
import 'package:admin/linkapi.dart';

class OrdersArchiveData {
  Crud crud;
  OrdersArchiveData(this.crud);
  orderArchive( ) async {
    var response =
        await crud.postData(AppLink.archiveorders, {});
    return response.fold((l) => l, (r) => r);
  }
}
