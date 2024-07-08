import 'package:admin/view/screen/orders/archive.dart';
import 'package:admin/view/screen/orders/prepare_Screen.dart';
import 'package:admin/view/screen/orders/bending.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OrdersScreenController extends GetxController {
  changePage(int currentpage);
}

class OrdersScreenControllerImp extends OrdersScreenController {
  int currentpage = 0;

  List<Widget> listPage = [
    BendingOrders(),
    AccepteOrders(),
    ArchiveOrders(),
    // SettingsScreen(),
  ];

  List titlebottomappbar = [
    {"icon": Icons.home, "name": "Pinding"},
    {"icon": Icons.card_travel, "name": "Accepted"},
    {"icon": Icons.archive, "name": "Archive"},
    // {"icon": Icons.settings, "name": "Seetongs"},
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
