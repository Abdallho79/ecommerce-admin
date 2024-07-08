import 'package:admin/controller/orders/prepare_controller.dart';
import 'package:admin/core/Class/HandlingDataView_Class.dart';
import 'package:admin/view/widget/orders/orderslistcardaccepte.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccepteOrders extends StatelessWidget {
  const AccepteOrders({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(AcceptedController());

    return Container(
        padding: const EdgeInsets.all(15),
        child: GetBuilder<AcceptedController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) {
                    return CardOrderListAccepte(
                      model: controller.data[index],
                    );
                  },
                ))));
  }
}
