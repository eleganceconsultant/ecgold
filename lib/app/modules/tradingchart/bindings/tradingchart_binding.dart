import 'package:get/get.dart';

import '../controllers/tradingchart_controller.dart';

class TradingchartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TradingchartController>(
      () => TradingchartController(),
    );
  }
}
