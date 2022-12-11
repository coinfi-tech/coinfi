import 'package:futurecoin/core/theme/colors.dart';
import 'package:futurecoin/core/theme/text_styles.dart';
import 'package:futurecoin/modules/main/portfolio/ui/invest/portfolio_invest.dart';
import 'package:flutter/material.dart';

import 'trade/portfolio_trade.dart';

class Portfolio extends StatelessWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: appBar(),
        body: TabBarView(
          children: [
            PortfolioInvest(),
            PortfolioTrade(),
          ],
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      centerTitle: false,
      elevation: 0,
      toolbarHeight: 64,
      backgroundColor: AppColors.appBarBackgroundColor,
      title: Text(
        "Portfolio",
        style: AppTextStyles.appBarHeading.copyWith(color: AppColors.textWhite),
      ),
      bottom: TabBar(
        labelPadding: EdgeInsets.all(16),
        labelColor: AppColors.textWhite,
        indicatorColor: AppColors.uiWhite,
        indicatorPadding: EdgeInsets.symmetric(horizontal: 80, vertical: 8),
        unselectedLabelColor: AppColors.uiGray_40,
        tabs: [tab("Invest"), tab("Trade")],
      ),
    );
  }

  Widget tab(String tab) {
    return Text(
      tab,
      style: AppTextStyles.tabHeading,
    );
  }
}
