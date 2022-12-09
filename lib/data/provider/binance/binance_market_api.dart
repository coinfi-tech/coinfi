import 'dart:convert';
import 'dart:developer';

import 'package:coinfi/data/models/instrument_model.dart';
import 'package:coinfi/data/models/test_data/instrument_test_data.dart';
import 'package:coinfi/data/models/test_data/market_test_data.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class BinanceMarketApiClient {
  // List<Stream<InstrumentModel>> getMarketDataStream() {
  //   final channel = WebSocketChannel.connect(
  //     Uri.parse('wss://echo.websocket.events'),
  //   );
  // }

  Stream<InstrumentModel> getInstrumentTickerStream(String instrumentTag) {
    final channel = WebSocketChannel.connect(
      Uri.parse('wss://fstream.binance.com/ws/${instrumentTag}usdt@ticker'),
    );
    return channel.stream.map(_instrumentModelFromInstrumentTickerEvent);
  }

  InstrumentModel _instrumentModelFromInstrumentTickerEvent(dynamic event) {
    // print(event);
    final Map<String, dynamic> parsed = json.decode(event);

    // var price = double.parse(parsed['data']['p']);
    // if (price == null) price = 0.00;
    InstrumentModel instrumentModel = InstrumentModel(
        instrument: parsed['s'] ?? "",
        currency: "USDT",
        price: double.parse(parsed['p'] ?? 0.00),
        change: double.parse(parsed['P'] ?? 0.00),
        marketDepth: MarketDepthTestData.marketDepthData,
        marketStats: MarketDepthTestData.marketStatsData);

    return instrumentModel;
  }
}
