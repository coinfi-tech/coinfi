import 'package:flutter/material.dart';

import '../../../core/theme/colors.dart';
import '../../../core/theme/text_styles.dart';

class InputOtherA extends StatelessWidget {
  const InputOtherA(
      {Key? key,
      required this.label,
      required this.placeholder,
      this.inputType = TextInputType.text,
      this.isObscureText = false,
      this.prefixIconData,
      this.suffixIconData,
      this.validator,
      this.textEditingController,
      this.isEnabled = true})
      : super(key: key);

  final String label;
  final String placeholder;
  final TextInputType inputType;
  final bool isObscureText;
  final IconData? prefixIconData;
  final IconData? suffixIconData;
  final FormFieldValidator<String>? validator;
  final TextEditingController? textEditingController;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    double borderRadius = 4;
    double borderWidth = 1;

    return TextFormField(
      enabled: isEnabled,
      validator: validator,
      controller: textEditingController,
      obscureText: isObscureText,
      textAlignVertical: TextAlignVertical.center,
      keyboardType: inputType,
      decoration: InputDecoration(
          filled: true,
          fillColor: isEnabled ? AppColors.uiWhite : AppColors.uiGray_20,
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              color: AppColors.uiGray_20,
              width: borderWidth,
            ),
          ),
          contentPadding: EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          label: Text(label),
          // hintText: placeholder,
          hintStyle:
              AppTextStyles.bodyRegular.copyWith(color: AppColors.textGray_60),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              color: AppColors.uiGray_40,
              width: borderWidth,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              color: AppColors.uiGray_40,
              width: borderWidth,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              color: AppColors.blue,
              width: borderWidth,
            ),
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text("USDT"),
          )),
    );
  }
}
