import 'package:coinfi/core/theme/colors.dart';
import 'package:coinfi/core/theme/text_styles.dart';
import 'package:coinfi/modules/main/portfolio/ui/invest/portfolio_invest.dart';
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
      elevation: 0,
      toolbarHeight: 64,
      backgroundColor: AppColors.uiGray_20,
      title: Text(
        "Portfolio",
        style: AppTextStyles.appBarHeading.copyWith(color: AppColors.uiGray_80),
      ),
      bottom: TabBar(
        labelPadding: EdgeInsets.all(16),
        labelColor: AppColors.blue,
        indicatorColor: AppColors.blue,
        unselectedLabelColor: AppColors.uiGray_80,
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
