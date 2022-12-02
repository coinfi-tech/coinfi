class MarketStatsModel {
  final double volume;
  final double high24h;
  final double low24h;
  final String exchange;
  MarketStatsModel(this.volume, this.high24h, this.low24h, this.exchange);

  List<List<String>> getTableData() {
    return [
      ["Volume", volume.toStringAsFixed(2)],
      ["24H High", high24h.toStringAsFixed(2)],
      ["24H Low", low24h.toStringAsFixed(2)],
      ["Exchange", exchange]
    ];
  }
}
