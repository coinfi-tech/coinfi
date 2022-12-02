import 'package:coinfi/modules/main/ui/app_main.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.APP_MAIN;

  static final routes = [
    GetPage(name: Routes.APP_MAIN, page: () => AppMain()),
  ];
}
