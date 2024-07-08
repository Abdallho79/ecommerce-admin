import 'package:admin/controller/categories/viewcat_controller.dart';
import 'package:admin/core/Class/HandlingDataView_Class.dart';
import 'package:admin/core/Constant/Routes_Const.dart';
import 'package:admin/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ViewCategriesScreen extends StatelessWidget {
  const ViewCategriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewCatController());
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRouts.catadd);
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Categories"),
      ),
      body: GetBuilder<ViewCatController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: WillPopScope(
                onWillPop: () {
                  return controller.myBack();
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: ListView.builder(
                      itemCount: controller.data.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            controller.goToEdit(controller.data[index]);
                          },
                          child: Card(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: SvgPicture.network(
                                      "${AppLink.imagestCategories}/${controller.data[index].categoriesImage}",
                                      height: 80,
                                      alignment: Alignment.centerLeft,
                                    ),
                                  ),
                                ),
                                Expanded(
                                    flex: 3,
                                    child: ListTile(
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                Get.defaultDialog(
                                                  title: "warning",
                                                  middleText:
                                                      "Are you sure to delete this category",
                                                  onCancel: () {},
                                                  onConfirm: () {
                                                    controller
                                                        .deleteData(index);
                                                    Get.back();
                                                  },
                                                );
                                              },
                                              icon: Icon(Icons.delete)),
                                        ],
                                      ),
                                      title: Text(controller
                                          .data[index].categoriesName!),
                                      subtitle: Text(controller
                                          .data[index].categoriesDatetime!),
                                    ))
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ))),
    );
  }
}
