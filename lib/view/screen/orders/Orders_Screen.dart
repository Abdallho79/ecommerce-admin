import 'package:admin/controller/orders/orderScreen_controller.dart';
import 'package:admin/view/widget/home/custombottomappbarhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersScreenControllerImp());
    // ignore: deprecated_member_use
    return GetBuilder<OrdersScreenControllerImp>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                title: Text(
                    "Orders ${controller.titlebottomappbar[controller.currentpage]["name"]}"),
              ),
              bottomNavigationBar: const CustomBottomAppBarHome(),
              body: Container(
                  child: controller.listPage.elementAt(controller.currentpage)),
            ));
  }
}
