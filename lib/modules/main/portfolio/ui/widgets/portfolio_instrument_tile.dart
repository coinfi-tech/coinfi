import 'package:coinfi/core/theme/colors.dart';
import 'package:coinfi/core/theme/dimensions.dart';
import 'package:coinfi/core/theme/text_styles.dart';
import 'package:coinfi/core/utils/AppFormatter.dart';
import 'package:coinfi/data/enums/order_type_enum.dart';
import 'package:coinfi/data/enums/product_type_enum.dart';
import 'package:coinfi/data/models/order_model.dart';
import 'package:coinfi/modules/global_widgets/icons/app_icons.dart';
import 'package:coinfi/modules/global_widgets/pill/pill_secondary.dart';
import 'package:flutter/material.dart';

class PortfolioInstrumentTile extends StatelessWidget {
  const PortfolioInstrumentTile({Key? key, required this.order})
      : super(key: key);

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    Color buySellColor = order.isBuy ? AppColors.blue : AppColors.accentRed;

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
                  Text("${AppFormatter.formatCurrency(order.price)}",
                      style: AppTextStyles.bodySmall),
                ],
              ),
              Text(
                order.getProfitPercentage() >= 0
                    ? "+${order.getProfitPercentage().toStringAsFixed(2)} %"
                    : "${order.getProfitPercentage().toStringAsFixed(2)} %",
                style: AppTextStyles.bodySmall.copyWith(
                    color: order.getProfit() >= 0
                        ? AppColors.green
                        : AppColors.accentRed),
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
                order.instrument.instrument,
                style: AppTextStyles.bodyRegular,
              ),
              Text(
                order.getProfit() >= 0
                    ? "+${AppFormatter.formatCurrencyUSD(order.getProfit())}"
                    : "${AppFormatter.formatCurrencyUSD(order.getProfit())}",
                style: AppTextStyles.bodyRegular.copyWith(
                    color: order.getProfit() >= 0
                        ? AppColors.green
                        : AppColors.accentRed),
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
                    AppFormatter.formatCurrency(order.invested),
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
                  Text(
                    "12640.70",
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
      color: isBuy ? AppColors.blue_20 : AppColors.accentRed.withOpacity(0.2),
      child: Text(
        isBuy ? "BUY" : "SELL",
        style: AppTextStyles.pillSmall
            .copyWith(color: isBuy ? AppColors.blue : AppColors.accentRed),
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
