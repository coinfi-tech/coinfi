import 'package:coinfi/data/models/strategy_model.dart';

class StrategyTestData {
  static StrategyModel strategy1 = StrategyModel(
      title: "Grid Trading",
      description:
          "Automatically place buy and sell orders above and below the current price",
      tags: ["Automatic", "Efficient Execution"]);
  static StrategyModel strategy2 = StrategyModel(
      title: "Momentum Trading",
      description: "Benefit from trending market movements",
      tags: ["Indicator", "Market movement"]);
  static StrategyModel strategy3 = StrategyModel(
      title: "Iceber Orders",
      description: "Slice large orders into multiple small orders.",
      tags: ["Optimization"]);
}
