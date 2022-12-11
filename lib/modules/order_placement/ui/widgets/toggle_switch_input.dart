import 'package:futurecoin/core/theme/colors.dart';
import 'package:futurecoin/core/theme/text_styles.dart';
import 'package:futurecoin/modules/global_widgets/input/input_primary.dart';
import 'package:futurecoin/modules/global_widgets/input/label_primary.dart';
import 'package:futurecoin/modules/order_placement/ui/widgets/order_form_label_with_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class ToggleSwitchInput extends StatefulWidget {
  ToggleSwitchInput({
    Key? key,
    required this.heading,
    required this.label,
    required this.inputField,
    required this.color,
    required this.icon,
  }) : super(key: key);

  String heading;
  String label;
  Widget inputField;
  Color color;
  IconData icon;

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
            OrderFormLabel(
                icon: widget.icon, label: widget.heading, color: widget.color),
            FlutterSwitch(
              width: 35.0 * 1.5,
              height: 17.5 * 1.5,
              toggleSize: 12.5 * 1.5,
              valueFontSize: 8.0 * 1.5,
              borderRadius: 10.0 * 1.5,
              padding: 2.0 * 1.5,
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
                    child: LabelPrimary(label: widget.label),
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
