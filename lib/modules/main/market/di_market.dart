import 'package:coinfi/data/provider/binance/binance_market_api.dart';
import 'package:coinfi/modules/main/market/state/market_data/market_data_controller.dart';
import 'package:coinfi/modules/main/market/state/market_data/market_data_repository.dart';
import 'package:get/get.dart';

class DIMarket {
  static void injectDependencies() {
    Get.lazyPut<MarketDataController>(() =>
        MarketDataController(MarketDataRepository(BinanceMarketApiClient())));
  }
}
