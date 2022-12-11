import 'package:futurecoin/core/constants/assets.dart';
import 'package:futurecoin/core/theme/colors.dart';
import 'package:futurecoin/core/theme/text_styles.dart';
import 'package:futurecoin/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Intro extends StatelessWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: getIntroPages(),
      showSkipButton: true,
      showNextButton: true,
      skip: const Text("Skip"),
      done: const Text("Done"),
      next: const Text("Next"),
      onDone: () {
        Get.offAllNamed(Routes.APP_MAIN);
      },
      onSkip: () {
        Get.offAllNamed(Routes.APP_MAIN);
      },
      dotsDecorator: DotsDecorator(
          activeColor: AppColors.intro_dot_active_color,
          color: AppColors.intro_dot_inactive_color),
    );
  }

  List<PageViewModel> getIntroPages() {
    double imageHeight = 260;
    PageDecoration pageDecoration = PageDecoration(
      imageFlex: 3,
      bodyFlex: 2,
      bodyTextStyle:
          AppTextStyles.bodyRegular.copyWith(color: AppColors.textGray_70),
      titleTextStyle: AppTextStyles.bodyLarge
          .copyWith(color: AppColors.textGray_80, fontWeight: FontWeight.w800),
    );

    return [
      PageViewModel(
        decoration: pageDecoration,
        title: "Welcome to futurecoin",
        body: "futurecoin is the simplest crypto trading app ever",
        image: SizedBox(
          height: imageHeight,
          child: SvgPicture.asset(Assets.introImage1),
        ),
      ),
      PageViewModel(
        decoration: pageDecoration,
        title: "Hassle free trading",
        body: "Trade directly using INR (₹)",
        image: SizedBox(
          height: imageHeight,
          child: SvgPicture.asset(Assets.introImage2),
        ),
      ),
      PageViewModel(
        decoration: pageDecoration,
        title: "0% TDS and lowest trading fees",
        body: "Experience the power of perpetual contracts",
        image: SizedBox(
          height: imageHeight,
          child: SvgPicture.asset(Assets.introImage3),
        ),
      ),
      PageViewModel(
        decoration: pageDecoration,
        title: "Strategy trading",
        body: "Deploy automated trading strategies to maximize your profits",
        image: SizedBox(
          height: imageHeight,
          child: SvgPicture.asset(Assets.introImage4),
        ),
      ),
    ];
  }
}
