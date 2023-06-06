import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  var activeKey = false.obs;
  var activeKPin = false.obs;
  var activeRegis = false.obs;
    var selectedIndex;
  var pinNumber = "";
  final count = 0.obs;
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
  ontapKey() {
    activeKey.value = !activeKey.value;
    activeKPin.value = false;
    activeRegis.value = false;
    print(activeKey);
  }

  ontapPin() {
    activeKPin.value = !activeKPin.value;
    activeKey.value = false;
    activeRegis.value = false;
    print(activeKPin);
  }

  ontapRegis() {
    activeRegis.value = !activeRegis.value;
    activeKPin.value = false;
    activeKey.value = false;
    print(activeRegis);
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
