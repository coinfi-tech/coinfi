import 'package:futurecoin/core/theme/colors.dart';
import 'package:futurecoin/core/theme/dimensions.dart';
import 'package:futurecoin/core/theme/text_styles.dart';
import 'package:futurecoin/core/utils/AppFormatter.dart';
import 'package:futurecoin/data/enums/product_type_enum.dart';
import 'package:futurecoin/data/models/order_model.dart';
import 'package:futurecoin/modules/global_widgets/icons/app_icons.dart';
import 'package:futurecoin/modules/global_widgets/pill/pill_primary.dart';
import 'package:futurecoin/modules/global_widgets/pill/pill_secondary.dart';
import 'package:futurecoin/modules/main/market/state/market_data/market_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderTile extends StatelessWidget {
  OrderTile({Key? key, required this.order}) : super(key: key);
  final OrderModel order;

  MarketDataController marketDataController = Get.find();

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
                  order.isBuy ? buyPill() : sellPill(),
                  SizedBox(width: 8),
                  if (order.productType == ProductTypeEnum.trade)
                    Row(
                      children: [
                        tradePill(order.leverage.toInt()),
                      ],
                    ),
                  if (order.productType == ProductTypeEnum.invest) investPill(),
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
              Row(
                children: [
                  Text(
                    order.instrument,
                    style: AppTextStyles.bodyRegular,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  if (order.productType == ProductTypeEnum.trade)
                    leveragePill(order.leverage.toInt()),
                ],
              ),
              Text(
                AppFormatter.formatCurrencyINR(order.price),
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
                  marketDataController.getPrice(order.instrument) != null
                      ? Obx(
                          () {
                            double ltp = marketDataController
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

  Widget buyPill() {
    return PillPrimary(text: "BUY", color: AppColors.buyColor);
  }

  Widget sellPill() {
    return PillPrimary(text: "SELL", color: AppColors.sellColor);
  }

  Widget investPill() {
    return PillSecondary(text: "INVEST", color: AppColors.uiGray_60);
  }

  Widget tradePill(int leverage) {
    return PillSecondary(text: "TRADE", color: AppColors.uiGray_60);
  }

  Widget leveragePill(int leverage) {
    return Text(
      "x${leverage}",
      style: AppTextStyles.bodySmall.copyWith(color: AppColors.textGray_60),
    );
  }

  Widget orderStatusPill(String status) {
    return PillSecondary(text: status, color: AppColors.uiGray_60);
  }

  Widget openOrderStatusPill() {
    return orderStatusPill("OPEN");
  }

  Widget partiallyFilledOrderStatusPill() {
    return orderStatusPill("PARTIALLY FILLED");
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
          //         totalQuantity >= 0 ? AppColors.green : AppColors.sellColor),
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
