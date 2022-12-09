import 'package:coinfi/core/theme/colors.dart';
import 'package:coinfi/core/theme/text_styles.dart';
import 'package:coinfi/modules/global_widgets/buttons/button_secondary.dart';
import 'package:coinfi/modules/main/market/ui/widgets/instrument_bottom_sheet/widgets/market_depth_table.dart';
import 'package:flutter/material.dart';

import '../../../../../../../data/models/market_depth_model.dart';

class MarketDepth extends StatelessWidget {
  const MarketDepth({Key? key, required this.marketDepthData})
      : super(key: key);

  final MarketDepthModel marketDepthData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///Title
          Text(
            "Market Depth",
            style: AppTextStyles.h5.copyWith(
                fontWeight: FontWeight.w700, color: AppColors.textGray_80),
          ),
          SizedBox(
            height: 8,
          ),

          ///Tables
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ///Table Bid
              bidTable(marketDepthData.getBidTableData()),
              SizedBox(
                width: 32,
              ),

              ///Table Ask
              askTable(marketDepthData.getAskTableData()),
            ],
          ),
          SizedBox(
            height: 4,
          ),
          ButtonSecondary(
            text: "Show More",
            onClick: () {},
            color: AppColors.blue,
          ),
        ],
      ),
    );
  }
}

Widget bidTable(List<List<String>> bidData) {
  List<String> colNames = ["Bid", "Qty"];
  return Expanded(
      child: MarketDepthTable(
    columnNames: colNames,
    data: bidData,
    cellTextColor: AppColors.buyColor,
  ));
}

Widget askTable(List<List<String>> askData) {
  List<String> colNames = ["Ask", "Qty"];
  return Expanded(
      child: MarketDepthTable(
    columnNames: colNames,
    data: askData,
    cellTextColor: AppColors.sellColor,
  ));
}
