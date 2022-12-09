import 'dart:developer';

import 'package:coinfi/data/models/instrument_model.dart';
import 'package:coinfi/data/models/test_data/instrument_test_data.dart';
import 'package:coinfi/data/models/test_data/market_test_data.dart';
import 'package:coinfi/modules/main/market/state/market_data/market_data_repository.dart';
import 'package:get/get.dart';

class MarketDataController extends GetxController {
  MarketDataController(this.marketDataRepository);

  List<Rx<InstrumentModel>> _instrumentList = [];
  MarketDataRepository marketDataRepository;

  // Rx<InstrumentModel> _instrument = InstrumentModel(
  //         instrument: "",
  //         currency: "",
  //         price: 0.00,
  //         change: 0.00,
  //         marketDepth: MarketDepthTestData.marketDepthData,
  //         marketStats: MarketDepthTestData.marketStatsData)
  //     .obs;
  //
  // Rx<InstrumentModel> get instrument => _instrument;

  @override
  void onInit() {
    super.onInit();

    var symbols = ['btc', 'eth', 'bnb']; //'xrp', 'matic', 'doge'];

    // _instrument
    //     .bindStream(marketDataRepository.getInstrumentTickerStream("btc"));
    // ever(_instrument,
    //     (instrument) => {log("Instrument: ${instrument.instrument}")});

    for (String symbol in symbols) {
      Rx<InstrumentModel> symbolStream = InstrumentModel(
              instrument: "",
              currency: "",
              price: 0.00,
              change: 0.00,
              marketDepth: MarketDepthTestData.marketDepthData,
              marketStats: MarketDepthTestData.marketStatsData)
          .obs;

      symbolStream
          .bindStream(marketDataRepository.getInstrumentTickerStream(symbol));
      _instrumentList.add(symbolStream);
    }
  }

  List<Rx<InstrumentModel>> get instrumentList => _instrumentList;
}
