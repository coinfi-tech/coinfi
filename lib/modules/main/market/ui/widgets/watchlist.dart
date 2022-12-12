import 'package:futurecoin/core/theme/dimensions.dart';
import 'package:futurecoin/data/models/instrument_model.dart';
import 'package:futurecoin/modules/global_widgets/divider/divider.dart';
import 'package:futurecoin/modules/global_widgets/icons/app_icons.dart';
import 'package:futurecoin/modules/main/market/state/market_data/market_data_controller.dart';
import 'package:futurecoin/modules/main/market/ui/widgets/instrument_bottom_sheet/instrument_bottom_sheet.dart';
import 'package:futurecoin/modules/main/market/ui/widgets/instrument_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:futurecoin/core/theme/colors.dart';
import 'package:futurecoin/core/theme/text_styles.dart';

class Watchlist extends StatelessWidget {
  Watchlist({Key? key}) : super(key: key);

  final MarketDataController marketDataController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
          // Obx(
          //   () => Column(
          //     children: marketDataController.instrumentMap.values
          //         .map(
          //           (instrument) => GestureDetector(
          //             behavior: HitTestBehavior.opaque,
          //             onTap: () {
          //               showInstrumentBottomSheet(context, instrument);
          //             },
          //             child: InstrumentTile(instrument: instrument.value),
          //           ),
          //         )
          //         .toList(),
          //   ),
          // ),
          Obx(
            () => Column(children: [
              for (String symbol in marketDataController.symbols)
                if (marketDataController.instrumentMap.containsKey(symbol))
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      showInstrumentBottomSheet(
                          context, marketDataController.instrumentMap[symbol]!);
                    },
                    child: InstrumentTile(
                        instrument:
                            marketDataController.instrumentMap[symbol]!.value),
                  ),
            ]),
          ),
        ],
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
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Obx(
          () => InstrumentBottomSheetLayout(
            instrument: instrument.value,
          ),
        );
      },
    );
  }
}
