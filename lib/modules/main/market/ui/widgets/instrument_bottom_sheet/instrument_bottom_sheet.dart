import 'dart:developer';

import 'package:futurecoin/core/theme/colors.dart';
import 'package:futurecoin/core/theme/text_styles.dart';
import 'package:futurecoin/core/utils/AppFormatter.dart';
import 'package:futurecoin/data/models/instrument_model.dart';
import 'package:futurecoin/data/models/test_data/market_test_data.dart';
import 'package:futurecoin/modules/global_widgets/buttons/button_primary_A.dart';
import 'package:futurecoin/modules/global_widgets/buttons/button_primary_B.dart';
import 'package:futurecoin/modules/global_widgets/buttons/button_secondary.dart';
import 'package:futurecoin/modules/main/market/ui/widgets/instrument_bottom_sheet/widgets/market_depth.dart';
import 'package:futurecoin/modules/main/market/ui/widgets/instrument_bottom_sheet/widgets/market_stats.dart';
import 'package:futurecoin/modules/order_placement/args/order_placement_screen_args.dart';
import 'package:futurecoin/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../global_widgets/divider/divider.dart';

class InstrumentBottomSheetLayout extends StatelessWidget {
  const InstrumentBottomSheetLayout({Key? key, required this.instrument})
      : super(key: key);

  final InstrumentModel instrument;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: DraggableScrollableSheet(
          initialChildSize: 0.4,
          minChildSize: 0.2,
          maxChildSize: 0.87,
          builder: (BuildContext context, ScrollController scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ///Instrument main details
                    instrumentTitle(),
                    const Divider(
                      color: AppColors.uiGray_40,
                      height: 0,
                    ),

                    ///Instrument data components
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buySellSection(),
                        dividerWithPadding(),
                        marketDepthSection(),
                        dividerWithPadding(),
                        marketStatsSection(),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget instrumentTitle() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            instrument.instrument,
            style: AppTextStyles.h4.copyWith(color: AppColors.uiGray_80),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text(
                AppFormatter.formatCurrencyINR(instrument.price),
                style: AppTextStyles.bodyRegular.copyWith(
                    color: instrument.change >= 0
                        ? AppColors.textGreen
                        : AppColors.textRed),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "${instrument.change.toStringAsFixed(2)}%",
                style: AppTextStyles.bodySmall,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget marketDepthSection() {
    return MarketDepth(
      marketDepthData: MarketDepthTestData.marketDepthData,
    );
  }

  Widget dividerWithPadding() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: AppDivider.uiDividerGray,
    );
  }

  Widget buySellSection() {
    return Container(
      padding: EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 12),
      child: Column(
        children: [
          ///Buy Sell
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ButtonPrimaryA(
                  text: "Buy",
                  onClick: () {
                    Get.toNamed(
                      Routes.ORDER_PLACEMENT,
                      arguments: OrderPlacementScreenArgs(
                          isBuy: true, instrument: instrument),
                    );
                  },
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: ButtonPrimaryB(
                  text: "Sell",
                  onClick: () {
                    Get.toNamed(
                      Routes.ORDER_PLACEMENT,
                      arguments: OrderPlacementScreenArgs(
                          isBuy: false, instrument: instrument),
                    );
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),

          ///View Chart
          ButtonSecondary(
            text: "View Chart",
            onClick: () {},
            iconLeft: Icons.bar_chart_rounded,
            iconRight: Icons.arrow_forward,
            color: AppColors.blue,
          ),
        ],
      ),
    );
  }

  Widget marketStatsSection() {
    return MarketStats(marketStatsModel: MarketDepthTestData.marketStatsData);
  }
}
