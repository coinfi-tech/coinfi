import 'package:coinfi/data/models/instrument_model.dart';
import 'package:coinfi/data/models/test_data/instrument_test_data.dart';
import 'package:get/get.dart';

class MarketDataController extends GetxController {
  List<InstrumentModel> _instrumentList = [];
  List<InstrumentModel> get instrumentList => _instrumentList;

  @override
  void onInit() {
    super.onInit();
    _instrumentList = [
      InstrumentTestData.btc,
      InstrumentTestData.eth,
      InstrumentTestData.sol
    ];
  }
}
