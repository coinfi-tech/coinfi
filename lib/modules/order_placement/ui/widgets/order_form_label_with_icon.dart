import 'package:futurecoin/core/theme/text_styles.dart';
import 'package:futurecoin/modules/global_widgets/input/label_primary.dart';
import 'package:flutter/material.dart';

class OrderFormLabel extends StatelessWidget {
  const OrderFormLabel(
      {Key? key, required this.label, required this.color, required this.icon})
      : super(key: key);

  final String label;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
        ),
        SizedBox(
          width: 8,
        ),
        LabelPrimary(label: label),
      ],
    );
  }
}
