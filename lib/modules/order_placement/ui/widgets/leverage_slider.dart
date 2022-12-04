import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeverageSlider extends StatefulWidget {
  const LeverageSlider({Key? key}) : super(key: key);

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
      child: Slider(
        value: _currentSliderValue,
        max: 15,
        min: 1,
        divisions: 15,
        label: _currentSliderValue.round().toString(),
        onChanged: (double value) {
          setState(() {
            _currentSliderValue = value;
          });
        },
      ),
    );
  }
}
