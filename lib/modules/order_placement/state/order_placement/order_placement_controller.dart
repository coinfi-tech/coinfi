import 'dart:developer';

import 'package:futurecoin/data/models/instrument_model.dart';
import 'package:futurecoin/modules/main/market/state/market_data/market_data_controller.dart';
import 'package:futurecoin/modules/order_placement/args/order_placement_screen_args.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class OrderPlacementController extends GetxController {
  bool _isBuy = true;
  bool get isBuy => _isBuy;
  set isBuy(bool value) {
    _isBuy = value;
  }

  double totalOrderValue = 0.00;

  List<bool> productTypeSelected = [true, false];
  List<String> productTypeList = ["Invest", "Trade"];

  List<bool> orderTypeSelected = [true, false];
  List<String> orderTypeList = ["Market", "Limit"];

  TextEditingController quantityInputController =
      TextEditingController(text: "0.1");
  TextEditingController priceInputController =
      TextEditingController(text: "0.00");
  TextEditingController stopLossInputController =
      TextEditingController(text: "-5.0");
  TextEditingController targetInputController =
      TextEditingController(text: "5.0");

  late InstrumentModel instrument;

  MarketDataController marketDataController = Get.find();

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      OrderPlacementScreenArgs args = Get.arguments as OrderPlacementScreenArgs;
      isBuy = args.isBuy;
      instrument = args.instrument;

      update();
    }
  }

  @override
  void onReady() {
    super.onReady();
    // quantityInputController.text = "0.1";
    totalOrderValue = double.parse(quantityInputController.text.isEmpty
            ? "0.00"
            : quantityInputController.text) *
        instrument.price;
    update();
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

  void onQuantityChanged(String qty) {
    double quantity = double.parse(qty);
    double price;
    if (orderTypeSelected[0]) {
      price = marketDataController
          .instrumentMap[instrument.instrument.toLowerCase()]!.value.price;
    } else {
      price = double.parse(priceInputController.text);
      log("price: ${priceInputController.text}");
    }
    totalOrderValue = quantity * price;
    update();
  }

  void onPriceChanged(String p) {
    double price = double.parse(p);
    double quantity = double.parse(quantityInputController.text);
    totalOrderValue = quantity * price;
    update();
  }
}
