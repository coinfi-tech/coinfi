import 'package:coinfi/data/models/test_data/instrument_test_data.dart';
import 'package:coinfi/modules/market/ui/widgets/instrument_tile.dart';
import 'package:flutter/material.dart';

import 'package:coinfi/core/theme/colors.dart';
import 'package:coinfi/core/theme/text_styles.dart';

class Market extends StatelessWidget {
  const Market({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Markets",
          style: AppTextStyles.h4.copyWith(color: AppColors.textGray_80),
        ),
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
      ),
      body: SafeArea(
          child: Column(
        children: [
          InstrumentTile(
            instrument: InstrumentTestData.btc,
          ),
          InstrumentTile(
            instrument: InstrumentTestData.eth,
          ),
          InstrumentTile(
            instrument: InstrumentTestData.sol,
          ),
        ],
      )),
    );
  }
}
