import 'package:admin/core/Class/StatusRequest_Class.dart';

StatusRequest handlingData(response) {
  if (response is StatusRequest) {
    return response;
  } else {
    return StatusRequest.success;
  }
}
