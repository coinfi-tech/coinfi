import 'package:coinfi/core/theme/colors.dart';
import 'package:coinfi/core/theme/dimensions.dart';
import 'package:coinfi/core/utils/AppFormatter.dart';
import 'package:coinfi/data/models/order_model.dart';
import 'package:coinfi/data/models/test_data/order_test_data.dart';
import 'package:coinfi/modules/global_widgets/divider/divider.dart';
import 'package:coinfi/modules/global_widgets/icons/app_icons.dart';
import 'package:coinfi/modules/main/portfolio/state/portfolio/portfolio_controller.dart';
import 'package:coinfi/modules/main/portfolio/ui/widgets/portfolio_instrument_tile.dart';
import 'package:coinfi/modules/main/portfolio/ui/widgets/profit_loss_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PortfolioInvest extends StatelessWidget {
  PortfolioInvest({Key? key}) : super(key: key);

  PortfolioController portfolioController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimensions.verticalPadding),
      child: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: Dimensions.horizontalPadding),
            child: Row(
              children: [
                Expanded(
                  child: ProfitLossCard(
                    profit: portfolioController.investProfit,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.horizontalPadding, vertical: 16),
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
          for (OrderModel order in portfolioController.investOrderList)
            Column(
              children: [
                PortfolioInstrumentTile(order: order),
                AppDivider.uiDividerGray_30,
              ],
            ),
        ],
      ),
    );
  }
}
