import 'package:futurecoin/modules/order_placement/state/order_placement/order_placement_controller.dart';
import 'package:get/get.dart';

class OrderPlacementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderPlacementController>(() => OrderPlacementController());
  }
}
