import 'package:coinfi/data/models/instrument_model.dart';
import 'package:coinfi/modules/main/market/state/market_data/market_data_controller.dart';
import 'package:coinfi/modules/main/market/ui/widgets/instrument_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coinfi/core/theme/colors.dart';
import 'package:coinfi/core/theme/text_styles.dart';

class Market extends StatelessWidget {
  Market({Key? key}) : super(key: key);

  final MarketDataController marketDataController = Get.find();

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
            for (InstrumentModel instrument
                in marketDataController.instrumentList)
              InstrumentTile(instrument: instrument),
          ],
        ),
      ),
    );
  }
}
