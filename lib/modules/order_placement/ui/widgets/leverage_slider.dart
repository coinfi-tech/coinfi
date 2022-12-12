import 'package:futurecoin/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:futurecoin/modules/order_placement/state/order_placement/order_placement_controller.dart';
import 'package:get/get.dart';

class LeverageSlider extends StatefulWidget {
  LeverageSlider({Key? key, required this.color}) : super(key: key);
  final Color color;
  final OrderPlacementController orderPlacementController = Get.find();

  @override
  State<LeverageSlider> createState() => _LeverageSliderState();
}

class _LeverageSliderState extends State<LeverageSlider> {
  double _currentSliderValue = 5;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context)
          .copyWith(showValueIndicator: ShowValueIndicator.always),
      child: Row(
        children: [
          Text(
            "${_currentSliderValue.toInt()}x",
            style:
                AppTextStyles.bodyRegular.copyWith(fontWeight: FontWeight.w700),
          ),
          Slider(
            value: _currentSliderValue,
            max: 15,
            min: 1,
            divisions: 15,
            label: _currentSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
              widget.orderPlacementController.onLeverageChanged(value);
            },
            activeColor: widget.color,
            inactiveColor: widget.color.withOpacity(0.2),
            thumbColor: widget.color,
          ),
        ],
      ),
    );
  }
}
