import 'package:futurecoin/core/utils/AppFormatter.dart';
import 'package:futurecoin/data/models/instrument_model.dart';
import 'package:futurecoin/modules/main/market/ui/widgets/instrument_bottom_sheet/instrument_bottom_sheet.dart';
import 'package:flutter/material.dart';

import 'package:futurecoin/core/theme/colors.dart';
import 'package:futurecoin/core/theme/text_styles.dart';

class InstrumentTile extends StatelessWidget {
  const InstrumentTile({Key? key, required this.instrument}) : super(key: key);

  final InstrumentModel instrument;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        instrument.instrument,
                        style: AppTextStyles.bodyRegular
                            .copyWith(color: AppColors.textGray_80),
                      ),
                      // Text(
                      //   " • ",
                      //   style: AppTextStyles.bodyRegular
                      //       .copyWith(color: AppColors.textGray_60),
                      // ),
                      // Text(
                      //   instrument.currency,
                      //   style: AppTextStyles.bodyRegular,
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "BINANCE",
                    style: AppTextStyles.bodySmall
                        .copyWith(color: AppColors.textGray_60),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    AppFormatter.formatCurrencyINR(instrument.price),
                    style: AppTextStyles.bodyRegular.copyWith(
                        color: instrument.change >= 0
                            ? AppColors.textGreen
                            : AppColors.textRed),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    "${instrument.change.toStringAsFixed(2)}%",
                    style: AppTextStyles.bodySmall,
                  )
                ],
              )
            ],
          ),
        ),
        const Divider(color: AppColors.uiGray_30)
      ],
    );
  }
}
