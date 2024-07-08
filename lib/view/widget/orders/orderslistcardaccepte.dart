import 'package:admin/controller/orders/prepare_controller.dart';
// import 'package:admin/controller/orders/pinding_controller.dart';
import 'package:admin/core/Constant/Color_Const.dart';
import 'package:admin/core/Constant/Routes_Const.dart';
import 'package:admin/data/model/Orders_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jiffy/jiffy.dart';

class CardOrderListAccepte extends GetView<AcceptedController> {
  final OrdersModel model;
  const CardOrderListAccepte({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Text(
                "Order Number  : ${model.ordersId} ",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              // Text()
              // From X
              Text(
                Jiffy.parse(model.ordersDatetime!).fromNow(),
                style: const TextStyle(
                    color: AppColor.primaryColor, fontWeight: FontWeight.bold),
              )
            ],
          ),
          const Divider(),
          Text("Order Type : ${controller.printTypeOrder(model.ordersType!)}"),
          Text("Order Price :  ${model.ordersPrice}\$"),
          Text("Delivey price : ${model.ordersPricedelivery} \$"),
          Text(
              "Paymant Method :  ${controller.printPaymantMethod(model.ordersPaymantmethod!)}"),
          Text("Status :  ${controller.printOrderStatus(model.ordersStatus!)}"),
          const Divider(),
          Row(
            children: [
              Text(
                "Total Price :  ${model.ordersTotalprice}",
                style: const TextStyle(
                    color: AppColor.primaryColor, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              MaterialButton(
                onPressed: () {
                  Get.toNamed(AppRouts.ordersdetails,
                      arguments: {"ordersdetails": model});
                },
                color: AppColor.thirdColor,
                textColor: AppColor.secondColor,
                child: const Text("details"),
              ),
              const SizedBox(
                width: 10,
              ),
              if (model.ordersStatus == "1")
                MaterialButton(
                  onPressed: () {
                    controller.donePrepareOrders(model.ordersUsersid!,
                        model.ordersId!, model.ordersType!);
                  },
                  color: AppColor.thirdColor,
                  textColor: AppColor.secondColor,
                  child: const Text("Done"),
                )
            ],
          ),
        ]),
      ),
    );
  }
}
