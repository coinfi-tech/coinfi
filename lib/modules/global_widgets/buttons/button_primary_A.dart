import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import 'button_primary.dart';

class ButtonPrimaryA extends StatelessWidget {
  final String text;
  final VoidCallback? onClick;

  const ButtonPrimaryA({
    Key? key,
    required this.text,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonPrimary(text: text, onClick: onClick, color: AppColors.green);
  }
}
