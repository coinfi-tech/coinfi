import 'dart:developer';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class OrderPlacementController extends GetxController {
  bool _isBuy = true;
  bool get isBuy => _isBuy;
  set isBuy(bool value) {
    _isBuy = value;
  }

  List<bool> productTypeSelected = [true, false];
  List<String> productTypeList = ["Invest", "Trade"];

  List<bool> orderTypeSelected = [true, false];
  List<String> orderTypeList = ["Market", "Limit"];

  void onToggle(bool status) {
    _isBuy = status;
    log(isBuy.toString());
    update();
  }

  void onProductTypePressed(int index) {
    for (int i = 0; i < productTypeSelected.length; i++) {
      productTypeSelected[i] = i == index;
    }
    update();
  }

  void onOrderTypePressed(int index) {
    for (int i = 0; i < orderTypeSelected.length; i++) {
      orderTypeSelected[i] = i == index;
    }
    update();
  }
}
