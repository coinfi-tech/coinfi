import 'package:futurecoin/modules/intro/ui/intro.dart';
import 'package:futurecoin/modules/main/app_main/ui/app_main.dart';
import 'package:futurecoin/modules/main/app_main_binding.dart';
import 'package:futurecoin/modules/order_placement/order_placement_binding.dart';
import 'package:futurecoin/modules/order_placement/ui/order_placement.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.INTRO;

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
    GetPage(
      name: Routes.INTRO,
      page: () => Intro(),
    ),
  ];
}
