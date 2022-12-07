import 'package:coinfi/data/enums/order_type_enum.dart';
import 'package:coinfi/data/enums/product_type_enum.dart';
import 'package:coinfi/data/models/order_model.dart';
import 'package:coinfi/data/models/test_data/instrument_test_data.dart';

class OrderTestData {
  static OrderModel order1 = OrderModel(
      isBuy: true,
      instrument: InstrumentTestData.btc,
      productType: ProductTypeEnum.invest,
      orderType: OrderTypeEnum.market,
      totalQuantity: 100,
      filledQuantity: 50,
      price: 12623.23);
  static OrderModel order2 = OrderModel(
      isBuy: false,
      instrument: InstrumentTestData.btc,
      productType: ProductTypeEnum.invest,
      orderType: OrderTypeEnum.limit,
      totalQuantity: 80,
      filledQuantity: 40,
      price: 12600.00);
  static OrderModel order3 = OrderModel(
      isBuy: true,
      instrument: InstrumentTestData.sol,
      productType: ProductTypeEnum.trade,
      leverage: 5,
      orderType: OrderTypeEnum.market,
      totalQuantity: 30,
      filledQuantity: 25,
      price: 15.65);
  static OrderModel order4 = OrderModel(
      isBuy: false,
      instrument: InstrumentTestData.sol,
      productType: ProductTypeEnum.trade,
      leverage: 5,
      orderType: OrderTypeEnum.limit,
      totalQuantity: 70,
      filledQuantity: 0,
      price: 13.00);
}
