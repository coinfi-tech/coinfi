import 'package:futurecoin/core/theme/colors.dart';
import 'package:futurecoin/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class PillPrimary extends StatelessWidget {
  const PillPrimary({Key? key, required this.text, required this.color})
      : super(key: key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      color: color.withOpacity(0.2),
      child: Text(
        text,
        style: AppTextStyles.pillSmall.copyWith(color: color),
      ),
    );
  }
}
