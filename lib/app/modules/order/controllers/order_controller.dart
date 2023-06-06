import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //TODO: Implement OrderController
  var tabs = [];
  var indexValue = 0.obs;
  var selectedColor = Color(0xff1a73e8);
  var unselectedColor = Color(0xff5f6368);
  late TabController tabController;
  var more = false.obs;
  var switchValue = false.obs;
  var check = false.obs;

  var type = "All".obs;
  var typeList = [
    "All",
    "Buy",
    "Sell",
  ];

  var goldType = "All".obs;
  var goldTypeList = [
    "All",
    "96.50%",
    "99.99%",
  ];
  var status = "All".obs;
  var statusList = [
    "All",
    "Waiting for payment",
    "***Payment some part",
    "Paid",
    "Waiting for deliver",
    "Deliver some part",
    "Deliver",
  ];

 

 

   void setType(value) {
    type.value = value;
    print(type);
  }
   void setGoldType(value) {
    goldType.value = value;
    print(goldType);
  }
   void setStatus(String value) {
    status.value = value;
    print(status);
  }

  setcheckBox() {
    check.value = !check.value;
  }

  setMore() {
    more.value = !more.value;
    //print(more.value);
  }

  ontap() {
    switchValue.value = !switchValue.value;
    print(switchValue);
  }

  setIndexValue(int value) {
    indexValue.value = value;
    print(indexValue.value);
  }

  final count = 0.obs;
  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
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

  void increment() => count.value++;
}
