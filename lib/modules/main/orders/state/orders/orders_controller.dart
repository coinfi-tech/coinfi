import 'package:coinfi/data/models/order_model.dart';
import 'package:coinfi/data/models/test_data/order_test_data.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController {
  List<OrderModel> _orderList = [];
  List<OrderModel> get orderList => _orderList;

  @override
  void onInit() {
    super.onInit();
    _orderList = [
      OrderTestData.order1,
      OrderTestData.order2,
      OrderTestData.order3,
      OrderTestData.order4,
    ];
  }
}
