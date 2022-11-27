import 'package:coinfi/data/models/instrument_model.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/dimensions.dart';
import '../../../constants/text_styles.dart';

class InstrumentTile extends StatelessWidget {
  const InstrumentTile({Key? key, required this.instrument}) : super(key: key);

  final InstrumentModel instrument;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(instrument.instrument, style: AppTextStyles.bodyRegular.copyWith(color: AppColors.textGray_80),),
                  Text(" • ", style: AppTextStyles.bodyRegular.copyWith(color: AppColors.textGray_60),),
                  Text(instrument.currency, style: AppTextStyles.bodyRegular,),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("${instrument.value}", style: AppTextStyles.bodyRegular.copyWith(color: instrument.change >= 0 ? AppColors.textGreen : AppColors.textRed),),
                  SizedBox(height: 2,),
                  Text("${instrument.change}%", style: AppTextStyles.bodySmall,)
                ],
              )

            ],
          ),
        ),
        Divider(
            color: AppColors.uiGray_40
        )
      ],

    );
  }
}
