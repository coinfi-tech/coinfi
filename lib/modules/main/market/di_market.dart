import 'package:coinfi/modules/main/market/state/market_data/market_data_controller.dart';
import 'package:get/get.dart';

class DIMarket {
  static void injectDependencies() {
    Get.lazyPut<MarketDataController>(() => MarketDataController());
  }
}
