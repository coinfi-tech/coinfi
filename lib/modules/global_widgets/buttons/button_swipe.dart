import 'package:futurecoin/core/theme/colors.dart';
import 'package:futurecoin/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class ButtonSwipe extends StatefulWidget {
  const ButtonSwipe({Key? key, required this.text, required this.color})
      : super(key: key);

  final String text;
  final Color color;

  @override
  State<ButtonSwipe> createState() => _ButtonSwipeState();
}

class _ButtonSwipeState extends State<ButtonSwipe> {
  bool isFinished = false;

  @override
  Widget build(BuildContext context) {
    return SwipeableButtonView(
      buttonText: widget.text,
      buttontextstyle: AppTextStyles.pillSmall.copyWith(
          color: AppColors.textWhite,
          fontWeight: FontWeight.w300,
          letterSpacing: 1.5),
      buttonWidget: Container(
        child: Icon(
          Icons.arrow_forward_ios_rounded,
          color: widget.color,
        ),
      ),
      activeColor: widget.color,
      isFinished: isFinished,
      onWaitingProcess: () {
        Future.delayed(Duration(seconds: 2), () {
          setState(() {
            isFinished = true;
          });
        });
      },
      onFinish: () async {
        // await Navigator.push(
        //     context,
        //     PageTransition(
        //         type: PageTransitionType.fade, child: DashboardScreen()));

        //TODO: For reverse ripple effect animation
        setState(() {
          isFinished = false;
        });
      },
    );
  }
}
