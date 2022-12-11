import 'package:coinfi/core/theme/colors.dart';
import 'package:coinfi/core/theme/text_styles.dart';
import 'package:coinfi/modules/global_widgets/divider/divider.dart';
import 'package:flutter/material.dart';

class AccountTile extends StatelessWidget {
  const AccountTile({Key? key, required this.title, required this.icon})
      : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTextStyles.body14.copyWith(
                  color: AppColors.uiGray_80,
                ),
              ),
              Icon(
                icon,
                color: AppColors.uiGray_60,
              ),
            ],
          ),
        ),
        AppDivider.uiDividerGray,
      ],
    );
  }
}
