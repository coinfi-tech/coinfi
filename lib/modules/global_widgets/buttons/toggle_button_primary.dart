import 'package:futurecoin/core/theme/colors.dart';
import 'package:futurecoin/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class ToggleButtonPrimary extends StatelessWidget {
  const ToggleButtonPrimary(
      {Key? key,
      required this.text,
      required this.isSelected,
      required this.selectionColor,
      required this.onPressed})
      : super(key: key);

  final String text;
  final bool isSelected;
  final Color selectionColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
        decoration: BoxDecoration(
          border: Border.all(
              color: isSelected ? selectionColor : AppColors.uiGray_30),
          borderRadius: BorderRadius.circular(2),
        ),
        child: Text(
          text,
          style: AppTextStyles.body14.copyWith(
              color: isSelected ? selectionColor : AppColors.uiGray_80),
        ),
      ),
    );
  }
}
