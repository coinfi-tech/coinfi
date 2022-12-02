import 'package:coinfi/data/models/instrument_model.dart';

class InstrumentTestData {
  static InstrumentModel btc = InstrumentModel(
      instrument: "BTC", currency: "USDT", value: 16595.5, change: 0.67);
  static InstrumentModel eth = InstrumentModel(
      instrument: "ETH", currency: "USDT", value: 1220.75, change: 2.58);
  static InstrumentModel sol = InstrumentModel(
      instrument: "SOL", currency: "USDT", value: 14.65, change: -3.21);
}
