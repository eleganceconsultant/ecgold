import 'package:ecgold/app/modules/trade/controllers/trade_controller.dart';
import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

class NavController extends GetxController {
  TradeController tradeController = Get.put(TradeController());
  var key = 0.obs;

  var currentIndexPage = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  ontapPage(value) {
    currentIndexPage.value = value;
  }

  gopage1() {
    currentIndexPage.value = 1;
   // tradeController.tabIndex.value = 1;
  }
  goOrderPage() {
    currentIndexPage.value = 2;
   // tradeController.tabIndex.value = 1;
  }
}
