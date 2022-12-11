import 'package:futurecoin/core/theme/colors.dart';
import 'package:futurecoin/core/theme/shadows.dart';
import 'package:futurecoin/core/theme/text_styles.dart';
import 'package:futurecoin/modules/global_widgets/icons/app_icons.dart';
import 'package:futurecoin/modules/main/account/ui/account.dart';
import 'package:futurecoin/modules/main/app_main/state/bottom_nav/app_main_bottom_nav_controller.dart';
import 'package:futurecoin/modules/main/market/ui/market.dart';
import 'package:futurecoin/modules/main/orders/ui/orders.dart';
import 'package:futurecoin/modules/main/portfolio/ui/portfolio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class AppMain extends StatelessWidget {
  AppMain({Key? key}) : super(key: key);

  final AppMainBottomNavController appMainController = Get.find();

  List<Widget> _buildScreens() {
    return [
      Market(),
      Orders(),
      Portfolio(),
      Account(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
    return [
      navBarItem(AppIcons.market, "Market"),
      navBarItem(AppIcons.orders, "Orders"),
      navBarItem(AppIcons.portfolio, "Portfolio"),
      navBarItem(AppIcons.account, "Account"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      navBarHeight: 64,
      // bottomScreenMargin: 100,
      padding: NavBarPadding.only(bottom: 12, top: 12),
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
      decoration: NavBarDecoration(
          colorBehindNavBar: Colors.white,
          boxShadow: AppShadows.bottomNavShadow),
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
      navBarStyle: NavBarStyle.style6,
      hideNavigationBar: false, // Choose the nav bar style with this property.
    );
  }

  PersistentBottomNavBarItem navBarItem(IconData iconData, String title) {
    return PersistentBottomNavBarItem(
        icon: Icon(
          iconData,
          size: 24,
        ),
        activeColorPrimary: AppColors.uiGray_80,
        inactiveColorPrimary: AppColors.uiGray_40,
        title: title,
        textStyle: AppTextStyles.bodySmall);
  }
}
