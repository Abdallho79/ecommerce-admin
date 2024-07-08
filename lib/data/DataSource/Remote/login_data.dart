import 'package:admin/core/Class/CRUD_Class.dart';
import 'package:admin/linkapi.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  checkData(String email, String password) async {
    var response = await crud
        .postData(AppLink.login, {'email': email, "password": password});
    return response.fold((l) => l, (r) => r);
  }

  resendData(String email, String name) async {
    var response =
        await crud.postData(AppLink.login, {'email': email, "name": name});
    return response.fold((l) => l, (r) => r);
  }
}
