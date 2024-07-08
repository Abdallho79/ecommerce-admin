import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

Future<File?> imageUploadCamera() async {
  XFile? xFile = await ImagePicker().pickImage(source: ImageSource.camera);
  if (xFile != null) {
    return File(xFile.path);
  } else {
    return null;
  }
}

imageUploadGallery([isSvg = false]) async {
  FilePickerResult? res = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: isSvg
          ? ["SVG", "svg"]
          : ["PNG", "png", "jpg", "JPG", "jpeg", 'GIF', "gif"]);
  if (res != null) {
    return File(res.files.single.path!);
  } else {
    return null;
  }
}

showBottomSheetImageOption(imageUploadCamera(), imageUploadGallery()) {
  Get.bottomSheet(
    Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              imageUploadGallery();
              Get.back(); // لإغلاق BottomSheet بعد الاختيار
            },
            child: const Column(
              children: [
                Icon(
                  Icons.photo_library,
                  size: 40,
                  color: Colors.blue,
                ),
                SizedBox(height: 8),
                Text(
                  "From Gallery",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              imageUploadCamera();
              Get.back();
            },
            child: const Column(
              children: [
                Icon(
                  Icons.camera_alt,
                  size: 40,
                  color: Colors.green,
                ),
                SizedBox(height: 8),
                Text(
                  "From Camera",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    isDismissible: true, // السماح بإغلاق BottomSheet عند النقر خارجها
  );
}
