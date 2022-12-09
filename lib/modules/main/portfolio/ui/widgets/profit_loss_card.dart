import 'package:coinfi/core/theme/colors.dart';
import 'package:coinfi/core/theme/shadows.dart';
import 'package:coinfi/core/theme/text_styles.dart';
import 'package:coinfi/core/utils/AppFormatter.dart';
import 'package:flutter/material.dart';

class ProfitLossCard extends StatelessWidget {
  const ProfitLossCard({Key? key, required this.profit}) : super(key: key);
  final double profit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      decoration: BoxDecoration(
          boxShadow: AppShadows.cardShadowMedium,
          color: AppColors.uiWhite,
          borderRadius: BorderRadius.circular(4)),
      child: Column(
        children: [
          Text(
            "Total P&L",
            style: AppTextStyles.body14.copyWith(color: AppColors.textGray_60),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            profit >= 0
                ? "+${AppFormatter.formatCurrencyUSD(profit)}"
                : "${AppFormatter.formatCurrencyUSD(profit)}",
            style: AppTextStyles.bodyLarge.copyWith(
                color: profit >= 0 ? AppColors.buyColor : AppColors.sellColor),
          ),
        ],
      ),
    );
  }
}
