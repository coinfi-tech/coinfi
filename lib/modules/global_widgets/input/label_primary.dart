import 'package:futurecoin/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class LabelPrimary extends StatelessWidget {
  const LabelPrimary({Key? key, required this.label}) : super(key: key);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: AppTextStyles.primaryLabelLarge,
    );
  }
}
