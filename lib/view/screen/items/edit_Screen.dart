import 'package:admin/controller/items/edit_controller.dart';
import 'package:admin/core/shared/CoustomButtonLimited_Class.dart';
import 'package:admin/core/shared/CoustomDropDwonList.dart';
import 'package:admin/core/shared/CoustomTextFormFieldd_Class.dart';
import 'package:admin/core/Class/HandlingDataView_Class.dart';
import 'package:admin/core/Functions/ValidInput_Functions.dart';
import 'package:admin/view/widget/login_widget/maintitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditItemsScreen extends StatelessWidget {
  const EditItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditItemsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Item"),
      ),
      body: GetBuilder<EditItemsController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Form(
                key: controller.key,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      CoustomTextFormAuth(
                          hinttext: "Add category name",
                          labeltext: "Name in english",
                          iconData: Icons.category,
                          mycontroller: controller.edit,
                          valid: (val) {
                            return validInput("none", val!, 1, 50);
                          },
                          isNumber: false),
                      CoustomTextFormAuth(
                          hinttext: "Add category name",
                          labeltext: "Name in arabic",
                          iconData: Icons.category,
                          mycontroller: controller.editar,
                          valid: (val) {
                            return validInput("none", val!, 1, 50);
                          },
                          isNumber: false),
                      CoustomTextFormAuth(
                          hinttext: "Items descrition",
                          labeltext: "description in English",
                          iconData: Icons.description,
                          mycontroller: controller.desc,
                          valid: (val) {
                            return validInput("none", val!, 1, 255);
                          },
                          isNumber: false),
                      CoustomTextFormAuth(
                        hinttext: "Add item description",
                        labeltext: "Description in Arabic",
                        iconData: Icons.description,
                        mycontroller: controller.descar,
                        valid: (val) {
                          return validInput("none", val!, 1, 255);
                        },
                        isNumber: false,
                      ),
                      CoustomTextFormAuth(
                        hinttext: "Add item count",
                        labeltext: "Item count",
                        iconData: Icons.format_list_numbered,
                        mycontroller: controller.count,
                        valid: (val) {
                          return validInput("number", val!, 0, 255);
                        },
                        isNumber: true,
                      ),
                      // CoustomTextFormAuth(
                      //   hinttext: "Is active (1 for yes, 0 for no)",
                      //   labeltext: "Active",
                      //   iconData: Icons.toggle_on,
                      //   mycontroller: controller.active,
                      //   valid: (val) {
                      //     return validInput("number", val!, 1, 1);
                      //   },
                      //   isNumber: true,
                      // ),
                      CoustomTextFormAuth(
                        hinttext: "Add item price",
                        labeltext: "Price",
                        iconData: Icons.attach_money,
                        mycontroller: controller.price,
                        valid: (val) {
                          return validInput("none", val!, 0, 255);
                        },
                        isNumber: true,
                      ),
                      CoustomTextFormAuth(
                        hinttext: "Add item discount",
                        labeltext: "Discount",
                        iconData: Icons.discount,
                        mycontroller: controller.discount,
                        valid: (val) {
                          return null;
                          // return validInput("none", val!, 1, 255);
                        },
                        isNumber: true,
                      ),

                      // CoustomTextFormAuth(
                      //   hinttext: "Add category ID",
                      //   labeltext: "Category ID",
                      //   iconData: Icons.category,
                      //   mycontroller: controller.catid,
                      //   valid: (val) {
                      //     return validInput("none", val!, 1, 255);
                      //   },
                      //   isNumber: true,
                      // ),
                      CoustomDropDwonSearch(
                          title: "Change categories",
                          listdata: controller.droplist,
                          dropdwonSelectedNameCon: controller.catname,
                          dropdwonSelectedIdCon: controller.catid),
                      SizedBox(
                        height: 10,
                      ),
                      RadioListTile(
                          title: Text("Hide"),
                          value: "0",
                          groupValue: controller.active,
                          onChanged: (val) {
                            controller.changeActive(val);
                          }),
                      RadioListTile(
                          title: Text("Active"),
                          value: "1",
                          groupValue: controller.active,
                          onChanged: (val) {
                            controller.changeActive(val);
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      Row(children: [
                        InkWell(
                          onTap: () {
                            controller.showOptionImage();
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
                              child: Image.file(
                            controller.file!,
                            height: 100,
                            width: 100,
                            fit: BoxFit.fill,
                          )) // show image
                      ]),
                      CoustomButton(
                        text: "Confirm",
                        paddinglenth: 30,
                        width: 100,
                        onPressed: () {
                          controller.editData();
                        },
                      )
                    ],
                  ),
                ),
              ))),
    );
  }
}
