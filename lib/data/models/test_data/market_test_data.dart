import 'package:coinfi/data/models/market_depth_model.dart';
import 'package:coinfi/data/models/market_stats_model.dart';

class MarketDepthTestData {
  static List<BidDataModel> getBidData() {
    List<BidDataModel> data = [];
    for (int i = 0; i < 5; i++) {
      data.add(BidDataModel(0, 0));
    }
    return data;
  }

  static List<AskDataModel> getAskData() {
    List<AskDataModel> data = [];
    for (int i = 0; i < 5; i++) {
      data.add(AskDataModel(0, 0));
    }
    return data;
  }

  static List<BidDataModel> bidData = getBidData();
  static List<AskDataModel> askData = getAskData();
  static MarketDepthModel marketDepthData = MarketDepthModel(bidData, askData);

  static MarketStatsModel marketStatsData =
      MarketStatsModel(3038332573.97, 17320, 16709.38, "Binance");
}
