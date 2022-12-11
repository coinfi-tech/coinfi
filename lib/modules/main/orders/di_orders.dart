import 'package:futurecoin/modules/main/orders/state/orders/orders_controller.dart';
import 'package:get/get.dart';

class DIOrders {
  static void injectDependencies() {
    Get.lazyPut<OrdersController>(() => OrdersController());
  }
}
