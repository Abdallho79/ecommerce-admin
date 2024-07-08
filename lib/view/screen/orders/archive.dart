import 'package:admin/controller/orders/archive_controller.dart';
import 'package:admin/core/Class/HandlingDataView_Class.dart';
import 'package:admin/view/widget/orders/orderslistcardbinding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArchiveOrders extends StatelessWidget {
  const ArchiveOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ArchiveController());

    return Scaffold(
    
      body: Container(
          padding: const EdgeInsets.all(15),
          child: GetBuilder<ArchiveController>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) {
                      return CardOrderList(
                        model: controller.data[index],
                      );
                    },
                  )))),
    );
  }
}
