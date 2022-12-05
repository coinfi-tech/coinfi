import 'package:coinfi/core/theme/colors.dart';
import 'package:coinfi/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class PillSecondary extends StatelessWidget {
  const PillSecondary({Key? key, required this.text, required this.color})
      : super(key: key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      color: AppColors.uiGray_20,
      child: Text(
        text,
        style: AppTextStyles.pillSmall.copyWith(color: color),
      ),
    );
  }
}
