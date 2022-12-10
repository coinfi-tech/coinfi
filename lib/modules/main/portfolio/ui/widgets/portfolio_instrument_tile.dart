import 'package:coinfi/core/theme/colors.dart';
import 'package:coinfi/core/theme/dimensions.dart';
import 'package:coinfi/core/theme/text_styles.dart';
import 'package:coinfi/core/utils/AppFormatter.dart';
import 'package:coinfi/data/enums/order_type_enum.dart';
import 'package:coinfi/data/enums/product_type_enum.dart';
import 'package:coinfi/data/models/order_model.dart';
import 'package:coinfi/data/models/position_model.dart';
import 'package:coinfi/modules/global_widgets/icons/app_icons.dart';
import 'package:coinfi/modules/global_widgets/pill/pill_secondary.dart';
import 'package:coinfi/modules/main/portfolio/state/portfolio/portfolio_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PortfolioInstrumentTile extends StatelessWidget {
  PortfolioInstrumentTile({Key? key, required this.position}) : super(key: key);

  final PositionModel position;

  final PortfolioController portfolioController = Get.find();

  @override
  Widget build(BuildContext context) {
    OrderModel order = position.order;
    Color buySellColor = order.isBuy ? AppColors.buyColor : AppColors.sellColor;

    return Container(
      padding: EdgeInsets.all(Dimensions.horizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  buySellPill(order.isBuy),
                  SizedBox(
                    width: 8,
                  ),
                  if (order.productType == ProductTypeEnum.trade)
                    Row(
                      children: [
                        leveragePill(5, buySellColor),
                        SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                  Text(
                    "Qty",
                    style: AppTextStyles.bodySmall
                        .copyWith(color: AppColors.textGray_60),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text("${order.filledQuantity}",
                      style: AppTextStyles.bodySmall),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Avg",
                    style: AppTextStyles.bodySmall
                        .copyWith(color: AppColors.textGray_60),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text("${AppFormatter.formatCurrencyINR(order.price)}",
                      style: AppTextStyles.bodySmall),
                ],
              ),
              position.profitPercentage != null
                  ? Text(
                      position.profitPercentage! >= 0
                          ? "+${position.profitPercentage!.toStringAsFixed(2)} %"
                          : "${position.profitPercentage!.toStringAsFixed(2)} %",
                      style: AppTextStyles.bodySmall.copyWith(
                          color: position.profitPercentage! >= 0
                              ? AppColors.buyColor
                              : AppColors.sellColor),
                    )
                  : Text(
                      "NaN",
                      style: AppTextStyles.bodySmall
                          .copyWith(color: AppColors.textGray_60),
                    ),
            ],
          ),
          SizedBox(
            height: 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                order.instrument,
                style: AppTextStyles.bodyRegular,
              ),
              position.profit != null
                  ? Text(
                      position.profit! >= 0
                          ? "+${AppFormatter.formatCurrencyINR(position.profit!)}"
                          : "${AppFormatter.formatCurrencyINR(position.profit!)}",
                      style: AppTextStyles.bodyRegular.copyWith(
                          color: position.profit! >= 0
                              ? AppColors.buyColor
                              : AppColors.sellColor),
                    )
                  : Text(
                      "NaN",
                      style: AppTextStyles.bodyRegular
                          .copyWith(color: AppColors.textGray_60),
                    ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "Invested",
                    style: AppTextStyles.bodySmall
                        .copyWith(color: AppColors.textGray_60),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    AppFormatter.formatCurrencyINR(order.invested),
                    style: AppTextStyles.bodySmall,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "LTP",
                    style: AppTextStyles.bodySmall
                        .copyWith(color: AppColors.textGray_60),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  portfolioController.marketDataController
                              .getPrice(order.instrument) !=
                          null
                      ? Obx(
                          () {
                            double ltp = portfolioController
                                .marketDataController
                                .getPrice(order.instrument)!;
                            return Text(
                              AppFormatter.formatCurrency(ltp),
                              style: AppTextStyles.bodySmall
                                  .copyWith(color: AppColors.textGray_60),
                            );
                          },
                        )
                      : Text(
                          "NaN",
                          style: AppTextStyles.bodySmall
                              .copyWith(color: AppColors.textGray_60),
                        ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buySellPill(bool isBuy) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      color: isBuy
          ? AppColors.buyColor.withOpacity(0.2)
          : AppColors.sellColor.withOpacity(0.2),
      child: Text(
        isBuy ? "BUY" : "SELL",
        style: AppTextStyles.pillSmall
            .copyWith(color: isBuy ? AppColors.buyColor : AppColors.sellColor),
      ),
    );
  }

  Widget timestamp(String time) {
    return Container(
      child: Row(
        children: [
          Icon(
            AppIcons.timestamp,
            color: AppColors.uiGray_60,
            size: 12,
          ),
          SizedBox(
            width: 2,
          ),
          Text(
            time,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textGray_60,
            ),
          )
        ],
      ),
    );
  }

  Widget leveragePill(int leverage, Color color) {
    return PillSecondary(text: "${leverage.toString()}X", color: color);
  }
}
