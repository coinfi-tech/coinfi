import 'package:coinfi/core/theme/colors.dart';
import 'package:coinfi/core/theme/shadows.dart';
import 'package:coinfi/core/theme/text_styles.dart';
import 'package:coinfi/data/models/strategy_model.dart';
import 'package:flutter/material.dart';

class StrategyCard extends StatelessWidget {
  const StrategyCard({Key? key, required this.strategyModel}) : super(key: key);

  final StrategyModel strategyModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: AppColors.uiWhite,
        boxShadow: AppShadows.cardShadowMedium,
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.grid_3x3,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    strategyModel.title,
                    style: AppTextStyles.bodyRegular
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_rounded,
                color: AppColors.uiGray_60,
              )
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            strategyModel.description,
            style:
                AppTextStyles.bodySmall.copyWith(color: AppColors.textGray_60),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              for (String tag in strategyModel.tags)
                Row(
                  children: [
                    getTagWidget(tag),
                    SizedBox(
                      width: 8,
                    ),
                  ],
                ),
            ],
          )
        ],
      ),
    );
  }

  Widget getTagWidget(String tag) {
    return Row(
      children: [
        Icon(
          Icons.check,
          size: 12,
          color: AppColors.green,
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          tag,
          style: AppTextStyles.bodySmall,
        )
      ],
    );
  }
}
