import 'package:coinfi/core/theme/colors.dart';
import 'package:coinfi/core/theme/text_styles.dart';
import 'package:coinfi/modules/global_widgets/icons/app_icons.dart';
import 'package:coinfi/modules/main/app_main/state/bottom_nav/app_main_bottom_nav_controller.dart';
import 'package:coinfi/modules/main/home/ui/home.dart';
import 'package:coinfi/modules/main/market/ui/market.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class AppMain extends StatelessWidget {
  AppMain({Key? key}) : super(key: key);

  final AppMainBottomNavController appMainController = Get.find();

  List<Widget> _buildScreens() {
    return [Home(), Market()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(
          AppIcons.home,
          size: 20,
        ),
        activeColorPrimary: AppColors.uiGray_80,
        inactiveColorPrimary: AppColors.uiGray_40,
        // title: "Home",

        // textStyle: AppTextStyles.bodySmall
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          AppIcons.market,
          size: 20,
        ),
        activeColorPrimary: AppColors.uiGray_80,
        inactiveColorPrimary: AppColors.uiGray_40,
        // title: "Market",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      navBarHeight: 80,
      // bottomScreenMargin: 100,
      padding: NavBarPadding.only(bottom: 10),
      controller: appMainController.persistentTabController,
      screens: _buildScreens(),
      items: _navBarsItems(context),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      // Default is Colors.white.
      handleAndroidBackButtonPress: true,
      // Default is true.
      // resizeToAvoidBottomInset: true,
      // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true,
      // Default is true.
      hideNavigationBarWhenKeyboardShows: true,
      // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration:
          const NavBarDecoration(colorBehindNavBar: Colors.white, boxShadow: [
        BoxShadow(
          color: AppColors.uiGray_20,
          blurRadius: 1,
          spreadRadius: 0,
          offset: Offset(0, 0),
        ),
      ]),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style3,
      hideNavigationBar: false, // Choose the nav bar style with this property.
    );
  }
}
