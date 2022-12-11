import 'package:futurecoin/data/enums/order_type_enum.dart';
import 'package:futurecoin/data/enums/product_type_enum.dart';
import 'package:futurecoin/data/models/order_model.dart';
import 'package:futurecoin/data/models/test_data/instrument_test_data.dart';

class OrderTestData {
  static OrderModel order1 = OrderModel(
      isBuy: true,
      instrument: "BTC",
      productType: ProductTypeEnum.invest,
      orderType: OrderTypeEnum.market,
      totalQuantity: 0.5,
      filledQuantity: 0.25,
      price: 1200000.00);
  static OrderModel order2 = OrderModel(
      isBuy: true,
      instrument: "ETH",
      productType: ProductTypeEnum.invest,
      orderType: OrderTypeEnum.limit,
      totalQuantity: 0.4,
      filledQuantity: 0.2,
      price: 110000.00);
  static OrderModel order3 = OrderModel(
      isBuy: true,
      instrument: "SOL",
      productType: ProductTypeEnum.trade,
      leverage: 5,
      orderType: OrderTypeEnum.market,
      totalQuantity: 30,
      filledQuantity: 25,
      price: 1000.00);
  static OrderModel order4 = OrderModel(
      isBuy: false,
      instrument: "SOL",
      productType: ProductTypeEnum.trade,
      leverage: 5,
      orderType: OrderTypeEnum.limit,
      totalQuantity: 70,
      filledQuantity: 0,
      price: 1350.00);
}
