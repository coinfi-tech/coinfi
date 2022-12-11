import 'package:futurecoin/data/models/instrument_model.dart';

class OrderPlacementScreenArgs {
  bool isBuy;
  InstrumentModel instrument;
  OrderPlacementScreenArgs({required this.isBuy, required this.instrument});
}
