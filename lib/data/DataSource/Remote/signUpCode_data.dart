import 'package:admin/core/Class/CRUD_Class.dart';
import 'package:admin/linkapi.dart';

class VerfiyCodeSignUpData {
  Crud crud;
  VerfiyCodeSignUpData(this.crud);
  checkData(String email, String code) async {
    var response = await crud
        .postData(AppLink.verifycodesignup, {"email": email, "code": code});
    return response.fold((l) => l, (r) => r);
  }

  resendData(String email) async {
    var response = await crud.postData(AppLink.resend, {'email': email});
    return response.fold((l) => l, (r) => r);
  }
}
