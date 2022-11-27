import 'package:coinfi/data/models/test/static_test_data.dart';
import 'package:coinfi/ui/screens/market/widgets/instrument_tile.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/text_styles.dart';

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
          InstrumentTile(instrument: StaticTestData.btc,),
          InstrumentTile(instrument: StaticTestData.eth,),
          InstrumentTile(instrument: StaticTestData.sol,),
        ],
      )),
    );
  }
}
