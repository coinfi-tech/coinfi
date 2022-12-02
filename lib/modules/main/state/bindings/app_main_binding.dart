import 'package:get/get.dart';

import '../controllers/app_main_screen_controller.dart';

class AppMainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppMainScreenController>(
      () => AppMainScreenController(),
    );
  }
}
