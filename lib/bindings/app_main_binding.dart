import 'package:coinfi/controllers/app_main_screen_controller.dart';
import 'package:get/get.dart';

class AppMainBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AppMainScreenController>(
          () => AppMainScreenController(),
    );
  }

}