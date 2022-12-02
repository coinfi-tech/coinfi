import 'package:coinfi/core/theme/colors.dart';
import 'package:coinfi/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class ButtonSecondary extends StatelessWidget {
  final String text;
  final VoidCallback? onClick;
  final IconData? iconRight;
  final IconData? iconLeft;
  final Color color;

  const ButtonSecondary(
      {Key? key,
      required this.text,
      required this.onClick,
      this.iconRight,
      this.iconLeft,
      this.color = AppColors.textGray_80})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.all(14)),
        foregroundColor: MaterialStateProperty.all<Color>(color),
        overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
      ),
      onPressed: onClick,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (iconLeft != null)
            Icon(
              iconLeft,
              color: color,
              size: 20,
            ),
          SizedBox(
            width: 8,
          ),
          Text(
            text,
            style: AppTextStyles.bodyRegular
                .copyWith(fontWeight: FontWeight.w400, color: color),
          ),
          SizedBox(
            width: 8,
          ),
          if (iconRight != null)
            Icon(
              iconRight,
              color: color,
              size: 20,
            ),
        ],
      ),
    );
  }
}
