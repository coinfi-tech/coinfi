import 'package:coinfi/core/theme/colors.dart';
import 'package:coinfi/core/theme/dimensions.dart';
import 'package:coinfi/core/theme/text_styles.dart';
import 'package:coinfi/core/utils/AppFormatter.dart';
import 'package:coinfi/data/enums/order_type_enum.dart';
import 'package:coinfi/data/enums/product_type_enum.dart';
import 'package:coinfi/data/models/order_model.dart';
import 'package:coinfi/modules/global_widgets/icons/app_icons.dart';
import 'package:coinfi/modules/global_widgets/pill/pill_primary.dart';
import 'package:coinfi/modules/global_widgets/pill/pill_secondary.dart';
import 'package:flutter/material.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({Key? key, required this.order}) : super(key: key);

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
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
                  if (order.productType == ProductTypeEnum.trade)
                    Row(
                      children: [
                        tradePill(order.leverage.toInt()),
                      ],
                    ),
                  if (order.productType == ProductTypeEnum.invest) investPill(),
                  SizedBox(width: 8),
                  order.isBuy ? buyPill() : sellPill(),
                  SizedBox(width: 8),
                  orderQuantityWidget(order.filledQuantity.toInt(),
                      order.totalQuantity.toInt()),
                ],
              ),
              Row(
                children: [
                  // timestamp("12:38:46"),
                  // SizedBox(width: 8),
                  if (order.filledQuantity == 0) openOrderStatusPill(),
                  if (order.filledQuantity > 0)
                    partiallyFilledOrderStatusPill(),
                ],
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
                AppFormatter.formatCurrencyUSD(order.price),
                style: AppTextStyles.bodyRegular,
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
                    "BINANCE",
                    style: AppTextStyles.bodySmall
                        .copyWith(color: AppColors.textGray_60),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    order.orderType.name.toUpperCase(),
                    style: AppTextStyles.bodySmall
                        .copyWith(color: AppColors.textGray_60),
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
                    AppFormatter.formatCurrency(order.instrument.price),
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

  Widget buyPill() {
    return PillPrimary(text: "BUY", color: AppColors.blue);
  }

  Widget sellPill() {
    return PillPrimary(text: "SELL", color: AppColors.accentRed);
  }

  Widget investPill() {
    return PillPrimary(text: "INVEST", color: Colors.green);
  }

  Widget tradePill(int leverage) {
    return PillPrimary(
        text: "TRADE ${leverage}x", color: AppColors.accentOrange);
  }

  Widget orderStatusPill(String status) {
    return PillSecondary(text: status, color: AppColors.uiGray_60);
  }

  Widget openOrderStatusPill() {
    return orderStatusPill("OPEN");
  }

  Widget partiallyFilledOrderStatusPill() {
    return orderStatusPill("PARTIAL");
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

  Widget orderQuantityWidget(int filledQuantity, int totalQuantity) {
    return Row(
      children: [
        Text(
          "${filledQuantity.toString()} / ${totalQuantity.toString()}",
          // style: AppTextStyles.bodySmall.copyWith(
          //     color:
          //         totalQuantity >= 0 ? AppColors.green : AppColors.accentRed),
          style: AppTextStyles.bodySmall.copyWith(color: AppColors.textGray_60),
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          "Qty.",
          style: AppTextStyles.bodySmall.copyWith(color: AppColors.textGray_60),
        )
      ],
    );
  }
}
