import 'package:coinfi/core/theme/colors.dart';
import 'package:coinfi/core/theme/dimensions.dart';
import 'package:coinfi/core/theme/text_styles.dart';
import 'package:coinfi/modules/global_widgets/icons/app_icons.dart';
import 'package:flutter/material.dart';

class PortfolioInstrumentTile extends StatelessWidget {
  const PortfolioInstrumentTile({Key? key}) : super(key: key);

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
              buySellPill(true),
              timestamp("12:38:46"),
            ],
          ),
          SizedBox(
            height: 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "BTC",
                style: AppTextStyles.bodyRegular,
              ),
              Text(
                "12623.23",
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
                    "LIMIT",
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
}
