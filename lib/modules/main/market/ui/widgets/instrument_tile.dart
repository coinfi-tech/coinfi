import 'package:coinfi/data/models/instrument_model.dart';
import 'package:coinfi/modules/main/market/ui/widgets/instrument_bottom_sheet/instrument_bottom_sheet.dart';
import 'package:flutter/material.dart';

import 'package:coinfi/core/theme/colors.dart';
import 'package:coinfi/core/theme/text_styles.dart';

class InstrumentTile extends StatelessWidget {
  const InstrumentTile({Key? key, required this.instrument}) : super(key: key);

  final InstrumentModel instrument;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            showInstrumentBottomSheet(context);
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "${instrument.value}",
                      style: AppTextStyles.bodyRegular.copyWith(
                          color: instrument.change >= 0
                              ? AppColors.textGreen
                              : AppColors.textRed),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "${instrument.change}%",
                      style: AppTextStyles.bodySmall,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        const Divider(color: AppColors.uiGray_40)
      ],
    );
  }

  void showInstrumentBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      ),
      backgroundColor: Colors.white,
      context: context,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.8,
          child: InstrumentBottomSheetLayout(
            instrument: instrument,
          ),
        );
      },
    );
  }
}
