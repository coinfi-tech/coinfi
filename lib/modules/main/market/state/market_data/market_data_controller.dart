import 'dart:collection';
import 'dart:developer';

import 'package:futurecoin/data/models/instrument_model.dart';
import 'package:futurecoin/data/models/test_data/instrument_test_data.dart';
import 'package:futurecoin/data/models/test_data/market_test_data.dart';
import 'package:futurecoin/modules/main/market/state/market_data/market_data_repository.dart';
import 'package:get/get.dart';

class MarketDataController extends GetxController {
  MarketDataController(this.marketDataRepository);

  final Map<String, Rx<InstrumentModel>> _instrumentMap = HashMap();
  MarketDataRepository marketDataRepository;
  var symbols = [
    'btc',
    'eth',
    'bnb',
    'sol',
    'xrp',
    'doge',
    'matic',
    'bch',
    'ltc',
    'ada',
    'ape',
    'dot',
  ];

  @override
  void onInit() {
    super.onInit();
    //'xrp', 'matic', 'doge'];
    for (String symbol in symbols) {
      Rx<InstrumentModel> symbolStream = InstrumentModel(
              instrument: "",
              currency: "",
              price: 0.00,
              change: 0.00,
              marketDepth: MarketDepthTestData.marketDepthData,
              marketStats: MarketDepthTestData.marketStatsData)
          .obs;

      try {
        symbolStream
            .bindStream(marketDataRepository.getInstrumentTickerStream(symbol));
        _instrumentMap[symbol] = symbolStream;
      } catch (e) {
        log("ERROR: ${e.toString()}");
      }
    }
  }

  double? getPrice(String instrumentSymbol) {
    if (_instrumentMap[instrumentSymbol.toLowerCase()] == null) {
      return null;
    } else {
      return _instrumentMap[instrumentSymbol.toLowerCase()]!.value.price;
    }
  }

  Map<String, Rx<InstrumentModel>> get instrumentMap => _instrumentMap;
}
