import 'package:futurecoin/core/utils/AppFormatter.dart';

import 'market_depth_model.dart';
import 'market_stats_model.dart';

class InstrumentModel {
  final String instrument;
  final String currency;
  final double price;
  final double change;
  final MarketStatsModel marketStats;
  final MarketDepthModel marketDepth;

  InstrumentModel(
      {required this.instrument,
      required this.currency,
      required this.price,
      required this.change,
      required this.marketDepth,
      required this.marketStats});
}
