import 'package:admin/core/Class/CRUD_Class.dart';
import 'package:admin/linkapi.dart';

class VerfiyCodeForgetPassData {
  Crud crud;
  VerfiyCodeForgetPassData(this.crud);
  checkData(String email, String code) async {
    var response = await crud.postData(
        AppLink.verifycodefprgetpassword, {"email": email, "code": code});
    return response.fold((l) => l, (r) => r);
  }
}
