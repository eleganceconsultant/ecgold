import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PortfolioController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //TODO: Implement PortfolioController

  final count = 0.obs;
  var percent = 0.obs;

  late TabController tabController;
  late List<GoldData> chartData;
  late TooltipBehavior tooltipBehavior;
  List<GoldData> getChartData() {
    final List<GoldData> chartData = [
      GoldData('goldWaitingForsend', 20, Color(0xFFE8EDF5)),
      GoldData('goldfromcustomer', 10, Color(0xFF88B9FC)),
      GoldData('goldWaiting', 5, Color(0xFF407FD6)),
    ];
    return chartData;
  }

  late List<GoldData99> chartData99;
  late TooltipBehavior tooltipBehavior99;
  List<GoldData99> getChartData99() {
    final List<GoldData99> chartData99 = [
      GoldData99('goldWaitingForsend99', 20, Color(0xFFE8EDF5)),
      GoldData99('goldfromcustomer99', 5, Color(0xFF88B9FC)),
      GoldData99('goldWaiting99', 15, Color(0xFF407FD6)),
    ];
    return chartData99;
  }

  
  var selectedColor = Color(0xff1a73e8);
  var unselectedColor = Color(0xff5f6368);

  var active = true.obs;
  var indexValue = 0.obs;
    setIndexValue(int value) {
    indexValue.value = value;
    print(indexValue.value);
  }

  void tab1() {
    active.value = true;
  }

  void tab2() {
    active.value = false;
    // print("Sell");
  }

  var selectedIndex;
  var pinNumber = "";
  var isObscure = true.obs;

  void addDigit(var digit) {
    pinNumber = pinNumber + digit.toString();
    print('Code is $pinNumber');
    selectedIndex = pinNumber.length;
    count.value = selectedIndex;
  }

  void isob() {
    isObscure.value = !isObscure.value;
    // print(isObscure.value);
  }

  backspace() {
    if (pinNumber.isEmpty) {
      return;
    }
    pinNumber = pinNumber.substring(0, pinNumber.length - 1);
    selectedIndex = pinNumber.length;
    count.value = selectedIndex;
    print('Code is $pinNumber');
  }

  @override
  void onInit() {
    chartData = getChartData();
    tooltipBehavior = TooltipBehavior(enable: true);
    chartData99 = getChartData99();
    tooltipBehavior99 = TooltipBehavior(enable: true);
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

class GoldData {
  GoldData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color? color;
}

class GoldData99 {
  GoldData99(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color? color;
}
