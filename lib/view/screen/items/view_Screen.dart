import 'package:admin/controller/items/view_controller.dart';
import 'package:admin/core/Class/HandlingDataView_Class.dart';
import 'package:admin/core/Constant/Routes_Const.dart';
import 'package:admin/linkapi.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewItemsScreen extends StatelessWidget {
  const ViewItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewItemsController());
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRouts.itemadd);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Items"),
      ),
      body: GetBuilder<ViewItemsController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: WillPopScope(
                onWillPop: () {
                  return controller.myBack();
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
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
                                      child: CachedNetworkImage(
                                          height: 80,
                                          // alignment: Alignment.centerLeft,
                                          imageUrl:
                                              "${AppLink.imagestItems}/${controller.data[index].itemsImage}")),
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
                                                      "Are you sure to delete this item",
                                                  onCancel: () {},
                                                  onConfirm: () {
                                                    controller
                                                        .deleteData(index);
                                                    Get.back();
                                                  },
                                                );
                                              },
                                              icon: const Icon(Icons.delete)),
                                          // IconButton(
                                          //     onPressed: () {
                                          //       controller.goToEdit(
                                          //           controller.data[index]);
                                          //     },
                                          //     icon: const Icon(Icons.edit)),
                                        ],
                                      ),
                                      title: Text(
                                          controller.data[index].itemsName!),
                                      subtitle: Text(controller
                                          .data[index].categoriesName!),
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
