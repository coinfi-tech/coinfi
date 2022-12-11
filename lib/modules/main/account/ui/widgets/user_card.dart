import 'package:futurecoin/core/constants/assets.dart';
import 'package:futurecoin/core/theme/colors.dart';
import 'package:futurecoin/core/theme/shadows.dart';
import 'package:futurecoin/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: AppShadows.cardShadowMedium,
        color: AppColors.uiWhite,
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Aarav Agarwal",
                style: AppTextStyles.body18.copyWith(
                    color: AppColors.textGray_80, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "aarav.agarwal@gmail.com",
                style: AppTextStyles.bodySmall
                    .copyWith(color: AppColors.textGray_60),
              ),
            ],
          ),
          CircleAvatar(
            radius: 36,
            backgroundColor: AppColors.uiGray_30.withOpacity(0.5),
            child: SvgPicture.asset(
              Assets.userAvatar,
              height: 40,
              width: 40,
            ),
          )
        ],
      ),
    );
  }
}
