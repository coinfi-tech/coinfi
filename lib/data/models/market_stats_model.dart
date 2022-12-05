import 'package:coinfi/core/utils/AppFormatter.dart';

class MarketStatsModel {
  final double volume;
  final double high24h;
  final double low24h;
  final String exchange;
  MarketStatsModel(this.volume, this.high24h, this.low24h, this.exchange);

  List<List<String>> getTableData() {
    return [
      ["Volume", AppFormatter.formatNumber(volume)],
      ["24H High", AppFormatter.formatNumber(high24h)],
      ["24H Low", AppFormatter.formatNumber(low24h)],
      ["Exchange", exchange]
    ];
  }
}
