import 'package:coinfi/data/enums/order_type_enum.dart';
import 'package:coinfi/data/enums/product_type_enum.dart';
import 'package:coinfi/data/models/instrument_model.dart';

class OrderModel {
  bool isBuy;
  InstrumentModel instrument;
  ProductTypeEnum productType;
  OrderTypeEnum orderType;
  double totalQuantity;
  double filledQuantity;
  double price;
  // double? limitPrice;
  double leverage;
  late double invested;
  // DateTime timestamp;

  OrderModel({
    required this.isBuy,
    required this.instrument,
    required this.productType,
    required this.orderType,
    required this.totalQuantity,
    required this.filledQuantity,
    required this.price,
    // this.limitPrice,
    this.leverage = 1,
    // required this.timestamp
  }) {
    invested = (price * filledQuantity) / leverage;
  }

  double getProfit(){
    return (price - instrument.price)*filledQuantity;
  }

  double getProfitPercentage(){
    return (getProfit()/invested)*100;
  }
}
