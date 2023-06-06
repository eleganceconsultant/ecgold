import 'package:get/get.dart';

import '../controllers/checkoutmoney_controller.dart';

class CheckoutmoneyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckoutmoneyController>(
      () => CheckoutmoneyController(),
    );
  }
}
