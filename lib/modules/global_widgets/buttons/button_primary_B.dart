import 'package:coinfi/core/theme/colors.dart';
import 'package:flutter/material.dart';

import 'button_primary.dart';

class ButtonPrimaryB extends StatelessWidget {
  final String text;
  final VoidCallback? onClick;

  const ButtonPrimaryB({
    Key? key,
    required this.text,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonPrimary(
        text: text, onClick: onClick, color: AppColors.sellColor);
  }
}
