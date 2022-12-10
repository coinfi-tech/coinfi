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
    try {
      final channel = WebSocketChannel.connect(
        Uri.parse('wss://fstream.binance.com/ws/${instrumentTag}usdt@ticker'),
      );
      return channel.stream.map(_instrumentModelFromInstrumentTickerEvent);
    } catch (e) {
      log("Error: ${e.toString()}");
      throw Exception("Couldn't fetch stream for instrument: $instrumentTag");
    }
  }

  InstrumentModel _instrumentModelFromInstrumentTickerEvent(dynamic event) {
    // print(event);
    final Map<String, dynamic> parsed = json.decode(event);

    // var price = double.parse(parsed['data']['p']);
    // if (price == null) price = 0.00;
    InstrumentModel instrumentModel = InstrumentModel(
        instrument: parsed['s'].toString().replaceAll("USDT", ""),
        currency: "USDT",
        price: double.parse(parsed['c']) * 85.00,
        change: double.parse(parsed['P']),
        marketDepth: MarketDepthTestData.marketDepthData,
        marketStats: MarketDepthTestData.marketStatsData);
    return instrumentModel;
  }
}
