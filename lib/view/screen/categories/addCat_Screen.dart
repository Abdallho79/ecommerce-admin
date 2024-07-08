

import 'package:admin/controller/categories/addcat_controller.dart';
import 'package:admin/core/shared/CoustomButtonLimited_Class.dart';
import 'package:admin/core/shared/CoustomTextFormFieldd_Class.dart';
import 'package:admin/core/Class/HandlingDataView_Class.dart';
import 'package:admin/core/Functions/ValidInput_Functions.dart';
import 'package:admin/view/widget/login_widget/maintitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
class AddCatScreen extends StatelessWidget {
  const AddCatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddCatController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Category"),
      ),
      body: GetBuilder<AddCatController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Form(
                key: controller.key,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: ListView(
                    children: [
                      CoustomTextFormAuth(
                          hinttext: "Add category name",
                          labeltext: "Name in english",
                          iconData: Icons.category,
                          mycontroller: controller.add,
                          valid: (val) {
                            return validInput("none", val!, 3, 30);
                          },
                          isNumber: false),
                      CoustomTextFormAuth(
                          hinttext: "Add category name",
                          labeltext: "Name in arabic",
                          iconData: Icons.category,
                          mycontroller: controller.addar,
                          valid: (val) {
                            return validInput("none", val!, 3, 30);
                          },
                          isNumber: false),
                      Row(children: [
                        InkWell(
                          onTap: () {
                            controller.chooseimage();
                          },
                          child: const CoustomTitle(
                              color: Colors.black,
                              text: "Upload Image",
                              size: 16,
                              alignmentGeometry: Alignment.centerRight,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        if (controller.file != null)
                          Center(
                              child: SvgPicture.file(
                                  controller.file!)) // show image
                      ]),
                      CoustomButton(
                        text: "Confirm",
                        paddinglenth: 30,
                        width: 100,
                        onPressed: () {
                          controller.addData();
                        },
                      )
                    ],
                  ),
                ),
              ))),
    );
  }
}
