import 'package:coinfi/data/models/instrument_model.dart';
import 'package:coinfi/modules/main/market/state/market_data/market_data_controller.dart';
import 'package:coinfi/modules/main/market/ui/widgets/instrument_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coinfi/core/theme/colors.dart';
import 'package:coinfi/core/theme/text_styles.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';
import 'package:coinfi/data/models/instrument_model.dart';
import '../../../../data/models/test_data/market_test_data.dart';

class Market extends StatefulWidget {
  Market({Key? key}) : super(key: key);

  @override
  State<Market> createState() => _MarketState();
}

class _MarketState extends State<Market> {
  var coinList = ['btc', 'eth', 'bnb', 'xrp']; //'xrp', 'matic', 'doge'];

  //final MarketDataController marketDataController = Get.find();
  // var curMarketData = new Map();
  // final _channel = WebSocketChannel.connect(
  //   Uri.parse(
  //       'wss://fstream.binance.com/stream?streams=btcusdt@markPrice@1s/bnbusdt@markPrice@1s'),
  // );
  // //Uri.parse('wss://fstream.binance.com/ws/btcusdt@markPrice@1s'),
  // streamListener() {
  //   _channel.stream.listen((messge) {
  //     print(messge);
  //     Map getData = jsonDecode(messge);
  //     print("00000000000000000000000000000000000000000000");
  //     //print(getData['p']);
  //   });
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   streamListener();
  // }

  Widget getStream(String cur) {
    final _channel = WebSocketChannel.connect(
      Uri.parse(
          'wss://fstream.binance.com/stream?streams=${cur}usdt@markPrice@1s'),
    );
    return StreamBuilder(
        stream: _channel.stream,
        builder: (context, snapshot) {
          //print(snapshot);
          final Map<String, dynamic> parsed = json.decode(snapshot.data);
          print(parsed);
          var value = double.parse(parsed['data']['p']);
          if (value == null) value = 0.00;
          print(value.runtimeType);
          var instrument = InstrumentModel(
              instrument: cur.toUpperCase(),
              currency: "USDT",
              value: value,
              change: 2.58,
              marketStats: MarketDepthTestData.marketStatsData,
              marketDepth: MarketDepthTestData.marketDepthData);
          return InstrumentTile(instrument: instrument);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 64,
        title: Text(
          "Markets",
          style: AppTextStyles.appBarHeading
              .copyWith(color: AppColors.textGray_80),
        ),
        backgroundColor: AppColors.uiGray_20,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            for (int i = 0; i < coinList.length; i++) getStream(coinList[i])
            // for (InstrumentModelDummy instrument
            //     in marketDataController.instrumentList)
            //   InstrumentTile(instrument: instrument),
          ],
        ),
      ),
    );
  }
}
