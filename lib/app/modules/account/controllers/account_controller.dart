import 'package:get/get.dart';

class AccountController extends GetxController {
  //TODO: Implement AccountController
  var changeData = false.obs;
  final count = 0.obs;

  ontapchangeData() {
    changeData.value = !changeData.value;
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
