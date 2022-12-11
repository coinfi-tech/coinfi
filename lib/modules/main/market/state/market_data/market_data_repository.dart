import 'package:futurecoin/data/models/instrument_model.dart';
import 'package:futurecoin/data/provider/binance/binance_market_api.dart';

class MarketDataRepository {
  final BinanceMarketApiClient marketApiClient;
  MarketDataRepository(this.marketApiClient);

  Stream<InstrumentModel> getInstrumentTickerStream(String instrumentTag) {
    return marketApiClient.getInstrumentTickerStream(instrumentTag);
  }
}
