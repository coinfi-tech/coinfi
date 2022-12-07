import 'dart:developer';

import 'package:coinfi/data/models/instrument_model.dart';
import 'package:coinfi/modules/order_placement/args/order_screen_args.dart';
import 'package:get/get.dart';
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

  @override
  void onReady() {
    super.onReady();
    if (Get.arguments != null) {
      OrderPlacementScreenArgs args = Get.arguments as OrderPlacementScreenArgs;
      isBuy = args.isBuy;
      update();
    }
  }

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
