import 'market_depth_model.dart';
import 'market_stats_model.dart';

class InstrumentModel{
  final String instrument;
  final String currency;
  final double value;
  final double change;
  final MarketStatsModel marketStats;
  final MarketDepthModel marketDepth;

  InstrumentModel({required this.instrument, required this.currency, required this.value, required this.change, required this.marketDepth, required this.marketStats});
}