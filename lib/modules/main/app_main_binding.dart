import 'package:coinfi/modules/main/app_main/di_app_main.dart';
import 'package:coinfi/modules/main/market/di_market.dart';
import 'package:coinfi/modules/main/orders/di_orders.dart';
import 'package:coinfi/modules/main/portfolio/di_portfolio.dart';
import 'package:get/get.dart';

import 'app_main/state/bottom_nav/app_main_bottom_nav_controller.dart';

class AppMainBinding extends Bindings {
  @override
  void dependencies() {
    //APP_MAIN
    DIAppMain.injectDependencies();

    //HOME

    //MARKET
    DIMarket.injectDependencies();

    //ORDERS
    DIOrders.injectDependencies();

    //PORTFOLIO
    DIPortfolio.injectDependencies();
  }
}
