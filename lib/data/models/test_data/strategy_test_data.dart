import 'package:futurecoin/data/models/strategy_model.dart';

class StrategyTestData {
  static StrategyModel strategy1 = StrategyModel(
      title: "Grid Trading",
      description:
          "Automatically place buy and sell orders above and below the current price",
      tags: ["Preset range"]);
  static StrategyModel strategy2 = StrategyModel(
      title: "Momentum Trading",
      description: "Benefit from trending market movements",
      tags: ["Trending markets"]);
  static StrategyModel strategy3 = StrategyModel(
      title: "Iceberg Orders",
      description: "Slice large orders into multiple small orders.",
      tags: ["Price optimization"]);
}
