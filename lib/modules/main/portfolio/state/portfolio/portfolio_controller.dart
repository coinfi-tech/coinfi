import 'package:coinfi/data/enums/product_type_enum.dart';
import 'package:coinfi/data/models/instrument_model.dart';
import 'package:coinfi/data/models/order_model.dart';
import 'package:coinfi/data/models/position_model.dart';
import 'package:coinfi/data/models/test_data/order_test_data.dart';
import 'package:coinfi/modules/main/market/state/market_data/market_data_controller.dart';
import 'package:get/get.dart';

class PortfolioController extends GetxController {
  MarketDataController marketDataController = Get.find();

  List<Rx<PositionModel>> _investPositionList = [];
  List<Rx<PositionModel>> _tradePositionList = [];

  Rx<double> _investProfit = 0.00.obs;
  Rx<double> _tradeProfit = 0.00.obs;

  @override
  void onInit() {
    super.onInit();
    List<OrderModel> orderList = [
      OrderTestData.order1,
      OrderTestData.order2,
      OrderTestData.order3,
      OrderTestData.order4,
    ];
    initOrderListByProductType(orderList);
  }

  void initOrderListByProductType(List<OrderModel> orders) {
    investPositionList = [];
    tradePositionList = [];

    for (OrderModel order in orders) {
      if (order.filledQuantity == 0) continue;

      Rx<PositionModel> positionStream = PositionModel(order: order).obs;

      Rx<InstrumentModel>? instrumentStream =
          marketDataController.instrumentMap[order.instrument.toLowerCase()];
      if (instrumentStream != null) {
        positionStream.bindStream(instrumentStream.stream.map((instrument) {
          double profit =
              (order.price - instrument.price) * order.filledQuantity;
          return PositionModel(
            order: order,
            profitPercentage: profit / order.invested,
            profit: profit,
          );
        }));
      }

      if (order.productType == ProductTypeEnum.invest) {
        investPositionList.add(positionStream);
      } else if (order.productType == ProductTypeEnum.trade) {
        tradePositionList.add(positionStream);
      }
    }
  }

  List<Rx<PositionModel>> get tradePositionList => _tradePositionList;
  set tradePositionList(List<Rx<PositionModel>> value) {
    _tradePositionList = value;
  }

  List<Rx<PositionModel>> get investPositionList => _investPositionList;
  set investPositionList(List<Rx<PositionModel>> value) {
    _investPositionList = value;
  }

  double get tradeProfit => _tradeProfit.value;
  set tradeProfit(double value) {
    _tradeProfit.value = value;
  }

  double get investProfit => _investProfit.value;
  set investProfit(double value) {
    _investProfit.value = value;
  }

  double getTotalProfitInvest() {
    double profit = 0;
    for (var position in investPositionList) {
      profit += position.value.profit ?? 0.0;
    }
    return profit;
  }

  double getTotalProfitTrade() {
    double profit = 0;
    for (var position in tradePositionList) {
      profit += position.value.profit ?? 0.0;
    }
    return profit;
  }
}
