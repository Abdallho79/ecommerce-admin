
import 'dart:io';

import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
    title: "Notice",
    middleText: "Do You Want to Leave The App",
    textConfirm: "Confirm",
    onConfirm: () {
      exit(0);
    },
    onCancel: () => Get.back(),
  );
  return Future.value(true);
}
