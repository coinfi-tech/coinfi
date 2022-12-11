import 'package:futurecoin/data/provider/binance/binance_market_api.dart';
import 'package:futurecoin/modules/main/market/state/market_data/market_data_controller.dart';
import 'package:futurecoin/modules/main/market/state/market_data/market_data_repository.dart';
import 'package:get/get.dart';

class DIMarket {
  static void injectDependencies() {
    Get.put<MarketDataController>(
        MarketDataController(MarketDataRepository(BinanceMarketApiClient())));
  }
}
