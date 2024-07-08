import 'package:get/get.dart';

validInput(String type, String val, int min, int max) {
  if (val.isEmpty) {
    return "Can't Be Empty";
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "Not Valid Email";
    }
  }
  if (type == "number") {
    if (!GetUtils.isNum(val)) {
      return "Not Valid Number";
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "Not Valid Phone Number";
    }
  }
  if (val.length <= min) {
    return "Can't Be Less Than $min";
  }
    if (val.length >= max) {
    return "Can't Be More Than $max";
  }
}
