import 'package:coinfi/core/theme/colors.dart';
import 'package:coinfi/data/models/test_data/strategy_test_data.dart';
import 'package:coinfi/modules/global_widgets/divider/divider.dart';
import 'package:coinfi/modules/global_widgets/icons/app_icons.dart';
import 'package:coinfi/modules/main/market/ui/widgets/strategy_card.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/dimensions.dart';

class StrategyBuilder extends StatelessWidget {
  const StrategyBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.horizontalPadding,
                vertical: Dimensions.verticalPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  AppIcons.search,
                  color: AppColors.blue,
                  size: 20,
                ),
                Icon(
                  AppIcons.filter,
                  color: AppColors.blue,
                  size: 20,
                ),
              ],
            ),
          ),
          AppDivider.uiDividerGray_30,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
                StrategyCard(strategyModel: StrategyTestData.strategy1),
                SizedBox(
                  height: 16,
                ),
                StrategyCard(strategyModel: StrategyTestData.strategy2),
                SizedBox(
                  height: 16,
                ),
                StrategyCard(strategyModel: StrategyTestData.strategy3),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
