import 'package:admin/controller/orders/orderScreen_controller.dart';
import 'package:admin/view/widget/home/custombuttonappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersScreenControllerImp>(
        builder: (controller) => BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            child: Row(
              children: [
                ...List.generate(controller.listPage.length, ((index) {
                  return Expanded(
                      child: CustomButtonAppBar(
                          icondata: controller.titlebottomappbar[index]["icon"],
                          iconname: controller.titlebottomappbar[index]["name"],
                          onPressed: () {
                            controller.changePage(index);
                          },
                          active:
                              controller.currentpage == index ? true : false));
                }))
              ],
            )));
  }
}
