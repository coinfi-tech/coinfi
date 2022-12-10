import 'package:coinfi/data/models/order_model.dart';

class PositionModel {
  OrderModel order;
  double? profit;
  double? profitPercentage;

  PositionModel({required this.order, this.profit, this.profitPercentage});
}
