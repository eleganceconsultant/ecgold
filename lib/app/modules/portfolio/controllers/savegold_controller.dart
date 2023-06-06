import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SaveGoldController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //TODO: Implement PortfolioController

  final count = 0.obs;

  final selected = "Gold Bar 99.99%".obs;
  var listType = [
    "Gold Bar 99.99%",
    "Gold Bar 96.50%",
  ].obs;

  void setSelected(String value) {
    selected.value = value;
  }
   final selectedSaka = "เยาวราช1".obs;
  var listTypeSaka = [
    "เยาวราช1",
    "เยาวราช2",
    "เยาวราช3",
    "เยาวราช4",
  ].obs;

  void setSelectedSaka(String value) {
    selectedSaka.value = value;
  }

  @override
  void onInit() {
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
