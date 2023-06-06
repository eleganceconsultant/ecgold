import 'package:get/get.dart';

class HistoryController extends GetxController {
  //TODO: Implement HistoryController

  final selected = "ประวัติ ฝาก-ถอน เงินหลักประกัน".obs;
  var month = "January".obs;
  var listType = [
    "ประวัติ ฝาก-ถอน เงินหลักประกัน",
    "ประวัติการรับทองคำ",
    "ประวัติการทำรายการซื้อ-ขาย",
    "ประวัติการทำรายการเคลียริ่ง",
  ].obs;
  var margin = "All".obs;
  var listMarginType = [
    "All",
    "Deposit",
    "Withdraw",
  ].obs;

  var marginStatus = "All".obs;
  var listMarginStatus = [
    "All",
    "Waiting",
    "Canceled",
    "Finish",
    "Pending",
  ].obs;

  var redeemStatus = "All".obs;
  var listRedeemStatus = [
    "All",
    "Finish",
    "Canceled",
  ].obs;

  var redeemGoldType = "All".obs;
  var listRedeemGoldType = [
    "All",
    "96.50 %",
    "99.99 %",
  ].obs;

  var buySellType = "All".obs;
  var listBuySellType = [
    "All",
    "Buy",
    "Sell",
  ].obs;

  var buySellGoldType = "All".obs;
  var listBuySellGoldType = [
    "All",
    "96.50 %",
    "99.99 %",
  ].obs;

  var buySellStatus = "All".obs;
  var listBuySellStatus = [
    "All",
    "Matched",
    "Canceled",
  ].obs;

  var clearingType = "All".obs;
  var listClearingType = [
    "All",
    "Buy",
    "Sell",
  ].obs;

  var clearingGoldType = "All".obs;
  var listClearingGoldType = [
    "All",
    "96.50%",
    "99.99%",
  ].obs;

  var clearingStatus = "All".obs;
  var listClearingStatus = [
    "All",
    "Paid",
    "Deliver",
  ].obs;

  var listMonth = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ].obs;

  var more = false.obs;

  void setSelected(String value) {
    selected.value = value;
    print(selected);
  }

  void setSelectedMarginType(String value) {
    margin.value = value;
    print(margin);
  }

  void setSelectedMarginStatus(String value) {
    marginStatus.value = value;
    print(marginStatus);
  }

  void setSelectedRedeemGoldType(String value) {
    redeemGoldType.value = value;
    print(value);
  }

  void setSelectedRedeemStatus(String value) {
    redeemStatus.value = value;
    print(value);
  }

  void setSelectedBuySellType(String value) {
    buySellType.value = value;
    print(value);
  }

  void setSelectedBuySellGoldType(String value) {
    buySellGoldType.value = value;
    print(value);
  }

  void setSelectedBuySellStatus(String value) {
    buySellStatus.value = value;
    print(value);
  }
  void setSelectedClearingType(String value) {
    clearingType.value = value;
    print(value);
  }
  void setSelectedClearingGoldType(String value) {
    clearingGoldType.value = value;
    print(value);
  }
  void setSelectedClearingStatus(String value) {
    clearingStatus.value = value;
    print(value);
  }

  void setMonth(value) {
    switch (value) {
      case 0:
        {
          month.value = listMonth[value];
          print(listMonth[value]);
        }
        break;
      case 1:
        {
          month.value = listMonth[value];
          print(listMonth[value]);
        }
        break;
      case 2:
        {
          month.value = listMonth[value];
          print(listMonth[value]);
        }
        break;
      case 3:
        {
          month.value = listMonth[value];
          print(listMonth[value]);
        }
        break;
      case 4:
        {
          month.value = listMonth[value];
          print(listMonth[value]);
        }
        break;
      case 5:
        {
          month.value = listMonth[value];
          print(listMonth[value]);
        }
        break;
      case 6:
        {
          month.value = listMonth[value];
          print(listMonth[value]);
        }
        break;
      case 7:
        {
          month.value = listMonth[value];
          print(listMonth[value]);
        }
        break;
      case 8:
        {
          month.value = listMonth[value];
          print(listMonth[value]);
        }
        break;
      case 9:
        {
          month.value = listMonth[value];
          print(listMonth[value]);
        }
        break;
      case 10:
        {
          month.value = listMonth[value];
          print(listMonth[value]);
        }
        break;
      case 11:
        {
          month.value = listMonth[value];
          print(listMonth[value]);
        }
        break;
      default:
        {
          print("Hello World");
        }
    }
  }

  setMore() {
    more.value = !more.value;
    print(more.value);
  }

  setDefault() {
    selected.value = "ประวัติ ฝาก-ถอน เงินหลักประกัน";
    print(selected);
  }

  setVallist() {
    selected.value = "ประวัติการทำรายการซื้อ-ขาย";
    print(selected);
  }

  setValClearing() {
    selected.value = "ประวัติการทำรายการเคลียริ่ง";
    print(selected);
  }

  final count = 0.obs;
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
