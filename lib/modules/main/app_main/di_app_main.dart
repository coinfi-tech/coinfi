import 'package:coinfi/modules/main/app_main/state/bottom_nav/app_main_bottom_nav_controller.dart';
import 'package:get/get.dart';

class DIAppMain {
  static void injectDependencies() {
    Get.lazyPut<AppMainBottomNavController>(() => AppMainBottomNavController());
  }
}
