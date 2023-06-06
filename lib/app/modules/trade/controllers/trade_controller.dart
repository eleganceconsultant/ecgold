import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TradeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //TODO: Implement TradeController

  var selectedColor = Color(0xff1a73e8);
  var unselectedColor = Color(0xff5f6368);
  var tabIndex = 0.obs;

  var active = true.obs;

  late TabController tabController;

  final selected = "Market Price".obs;
  var listType = [
    "Market Price",
    "Limit Price",
    "Stop Limit Order",
  ].obs;

  void tapIndex() {}

  void setSelected(String value) {
    selected.value = value;
    print(selected);
  }

  var valueTap = 0.obs;

  final count = 0.obs;
  setTap(value) {
    valueTap.value = value;
   // tabIndex.value = value;
    print(value);
  }
 

  @override
  void onInit() {
    tabController =
        TabController(length: 2, vsync: this, //initialIndex: 1
        );
    print(tabController);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void tabBuy() {
    active.value = true;
    // print(active.value);

    //  print("Buy");
  }

  void tabSell() {
    active.value = false;

    // print("Sell");
  }

  void increment() => count.value++;
}
