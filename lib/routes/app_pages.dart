import 'package:coinfi/modules/main/app_main/ui/app_main.dart';
import 'package:coinfi/modules/main/app_main_binding.dart';
import 'package:coinfi/modules/order_placement/order_placement_binding.dart';
import 'package:coinfi/modules/order_placement/ui/order_placement.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.APP_MAIN;

  static final routes = [
    GetPage(
      name: Routes.APP_MAIN,
      page: () => AppMain(),
      binding: AppMainBinding(),
    ),
    GetPage(
      name: Routes.ORDER_PLACEMENT,
      page: () => OrderPlacement(),
      binding: OrderPlacementBinding(),
    ),
  ];
}
