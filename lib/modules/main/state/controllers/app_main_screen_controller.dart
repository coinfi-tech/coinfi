
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class AppMainScreenController extends GetxController{

  final PersistentTabController persistentTabController =
  PersistentTabController(initialIndex: 0);

  @override
  void onInit() {
    super.onInit();
  }
}