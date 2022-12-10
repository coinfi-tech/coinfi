import 'package:coinfi/core/theme/dimensions.dart';
import 'package:coinfi/data/models/instrument_model.dart';
import 'package:coinfi/modules/global_widgets/divider/divider.dart';
import 'package:coinfi/modules/global_widgets/icons/app_icons.dart';
import 'package:coinfi/modules/main/market/state/market_data/market_data_controller.dart';
import 'package:coinfi/modules/main/market/ui/widgets/instrument_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coinfi/core/theme/colors.dart';
import 'package:coinfi/core/theme/text_styles.dart';

import 'widgets/instrument_bottom_sheet/instrument_bottom_sheet.dart';

class Market extends StatelessWidget {
  Market({Key? key}) : super(key: key);

  final MarketDataController marketDataController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        toolbarHeight: 64,
        title: Text(
          "Markets",
          style:
              AppTextStyles.appBarHeading.copyWith(color: AppColors.textWhite),
        ),
        backgroundColor: AppColors.appBarBackgroundColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.horizontalPadding,
                  vertical: Dimensions.verticalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    AppIcons.search,
                    color: AppColors.blue,
                    size: 20,
                  ),
                  Icon(
                    AppIcons.filter,
                    color: AppColors.blue,
                    size: 20,
                  ),
                ],
              ),
            ),
            AppDivider.uiDividerGray_30,
            Obx(
              () => Column(
                children: marketDataController.instrumentMap.values
                    .map(
                      (instrument) => GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          showInstrumentBottomSheet(context, instrument);
                        },
                        child: InstrumentTile(instrument: instrument.value),
                      ),
                    )
                    .toList(),
                // children: [
                //   for (var instrument
                //       in marketDataController.instrumentMap.entries)
                //     GestureDetector(
                //         behavior: HitTestBehavior.opaque,
                //         onTap: () {
                //           showInstrumentBottomSheet(context, instrument);
                //         },
                //         child: InstrumentTile(instrument: instrument.value)),
                // ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showInstrumentBottomSheet(
      BuildContext context, Rx<InstrumentModel> instrument) {
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
          child: Obx(
            () => InstrumentBottomSheetLayout(
              instrument: instrument.value,
            ),
          ),
        );
      },
    );
  }
}
