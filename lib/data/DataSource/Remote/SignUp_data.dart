import 'package:admin/LinkAPI.dart';
import 'package:admin/core/Class/CRUD_Class.dart';

class SignUpData {
  Crud crud;
  SignUpData(this.crud);
  insertData(String email, String phone, String name, String password) async {
    Map data = {
      "email": email,
      "phone": phone,
      "password": password,
      "username": name
    };
    var response = await crud.postData(AppLink.signup, data);
    return response.fold((l) => l, (r) => r);
  }
}
