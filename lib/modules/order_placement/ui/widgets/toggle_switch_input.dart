import 'package:coinfi/core/theme/colors.dart';
import 'package:coinfi/core/theme/text_styles.dart';
import 'package:coinfi/modules/global_widgets/input/input_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class ToggleSwitchInput extends StatefulWidget {
  ToggleSwitchInput({
    Key? key,
    required this.heading,
    required this.label,
    required this.inputField,
    required this.color,
  }) : super(key: key);

  String heading;
  String label;
  Widget inputField;
  Color color;

  @override
  State<ToggleSwitchInput> createState() => _ToggleSwitchInputState();
}

class _ToggleSwitchInputState extends State<ToggleSwitchInput> {
  bool toggleState = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.show_chart,
                  color: widget.color,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  widget.heading,
                  style: AppTextStyles.primaryLabelLarge,
                ),
              ],
            ),
            FlutterSwitch(
              value: toggleState,
              activeColor: widget.color,
              onToggle: (bool status) {
                setState(
                  () {
                    toggleState = status;
                  },
                );
              },
            ),
          ],
        ),
        if (toggleState)
          Column(
            children: [
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      widget.label,
                      style: AppTextStyles.primaryLabelLarge,
                    ),
                  ),
                  Expanded(flex: 2, child: widget.inputField),
                ],
              ),
            ],
          ),
      ],
    );
  }
}
