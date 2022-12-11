import 'package:futurecoin/core/theme/colors.dart';
import 'package:futurecoin/core/theme/dimensions.dart';
import 'package:futurecoin/core/theme/text_styles.dart';
import 'package:futurecoin/data/models/order_model.dart';
import 'package:futurecoin/modules/global_widgets/divider/divider.dart';
import 'package:futurecoin/modules/global_widgets/icons/app_icons.dart';
import 'package:futurecoin/modules/main/portfolio/state/portfolio/portfolio_controller.dart';
import 'package:futurecoin/modules/main/portfolio/ui/widgets/portfolio_instrument_tile.dart';
import 'package:futurecoin/modules/main/portfolio/ui/widgets/profit_loss_card.dart';
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
                  child: Obx(
                    () => ProfitLossCard(
                      profit: portfolioController.getTotalProfitInvest(),
                    ),
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
                Row(
                  children: [
                    Text(
                      "Invest History",
                      style:
                          AppTextStyles.link14.copyWith(color: AppColors.blue),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      AppIcons.filter,
                      color: AppColors.blue,
                      size: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
          AppDivider.uiDividerGray_30,
          Obx(() => Column(
                children: [
                  for (var positionModel
                      in portfolioController.investPositionList)
                    Column(
                      children: [
                        PortfolioInstrumentTile(position: positionModel.value),
                        AppDivider.uiDividerGray_30,
                      ],
                    ),
                ],
              )),
        ],
      ),
    );
  }
}
