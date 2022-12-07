import 'package:coinfi/data/enums/product_type_enum.dart';
import 'package:coinfi/data/models/order_model.dart';
import 'package:coinfi/data/models/test_data/order_test_data.dart';
import 'package:get/get.dart';

class PortfolioController extends GetxController {

  List<OrderModel> _investOrderList = [];
  List<OrderModel> _tradeOrderList = [];

  double _investProfit = 0;
  double _tradeProfit = 0;

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

  void initOrderListByProductType(List<OrderModel> orders){
    investOrderList = [];
    tradeOrderList = [];

    for(OrderModel order in orders){
      if(order.filledQuantity == 0) continue;
      if(order.productType == ProductTypeEnum.trade){
        tradeOrderList.add(order);
        tradeProfit += order.getProfit();
      } else if (order.productType == ProductTypeEnum.invest){
        investOrderList.add(order);
        investProfit += order.getProfit();
      }
    }
  }



  List<OrderModel> get tradeOrderList => _tradeOrderList;
  set tradeOrderList(List<OrderModel> value) {
    _tradeOrderList = value;
  }

  List<OrderModel> get investOrderList => _investOrderList;
  set investOrderList(List<OrderModel> value) {
    _investOrderList = value;
  }

  double get tradeProfit => _tradeProfit;
  set tradeProfit(double value) {
    _tradeProfit = value;
  }

  double get investProfit => _investProfit;
  set investProfit(double value) {
    _investProfit = value;
  }
}