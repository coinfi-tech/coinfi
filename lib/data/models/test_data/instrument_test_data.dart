import 'package:coinfi/data/models/instrument_model.dart';
import 'market_test_data.dart';

class InstrumentTestData {
  static InstrumentModel btc = InstrumentModel(
      instrument: "BTC",
      currency: "USDT",
      value: 16595.5,
      change: 0.67,
      marketStats: MarketDepthTestData.marketStatsData,
      marketDepth: MarketDepthTestData.marketDepthData);
  static InstrumentModel eth = InstrumentModel(
      instrument: "ETH",
      currency: "USDT",
      value: 1220.75,
      change: 2.58,
      marketStats: MarketDepthTestData.marketStatsData,
      marketDepth: MarketDepthTestData.marketDepthData);
  static InstrumentModel sol = InstrumentModel(
      instrument: "SOL",
      currency: "USDT",
      value: 14.65,
      change: -3.21,
      marketStats: MarketDepthTestData.marketStatsData,
      marketDepth: MarketDepthTestData.marketDepthData);
}
