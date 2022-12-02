import 'package:coinfi/data/models/market_stats_model.dart';
import 'package:coinfi/modules/instrument/ui/widgets/market_stats_table.dart';
import 'package:flutter/material.dart';

import 'package:coinfi/core/theme/colors.dart';
import 'package:coinfi/core/theme/text_styles.dart';

class MarketStats extends StatelessWidget {
  const MarketStats({Key? key, required this.marketStatsModel})
      : super(key: key);

  final MarketStatsModel marketStatsModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///Title
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Market Stats",
              style: AppTextStyles.h5.copyWith(
                  fontWeight: FontWeight.w700, color: AppColors.textGray_80),
            ),
          ),
          const SizedBox(
            height: 16,
          ),

          ///Table
          MarketStatsTable(data: marketStatsModel.getTableData()),
        ],
      ),
    );
  }
}
