import 'dart:developer';

import 'package:coinfi/core/theme/colors.dart';
import 'package:coinfi/core/theme/shadows.dart';
import 'package:coinfi/data/models/instrument_model.dart';
import 'package:coinfi/modules/global_widgets/buttons/button_swipe.dart';
import 'package:coinfi/modules/global_widgets/buttons/toggle_button_primary.dart';
import 'package:coinfi/modules/global_widgets/divider/divider.dart';
import 'package:coinfi/modules/global_widgets/input/input_primary.dart';
import 'package:coinfi/modules/global_widgets/input/label_primary.dart';
import 'package:coinfi/modules/main/orders/args/order_screen_args.dart';
import 'package:coinfi/modules/order_placement/state/order_placement/order_placement_controller.dart';
import 'package:coinfi/modules/order_placement/ui/widgets/leverage_slider.dart';
import 'package:coinfi/modules/order_placement/ui/widgets/order_form_label_with_icon.dart';
import 'package:coinfi/modules/order_placement/ui/widgets/toggle_switch_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

import '../../../core/theme/dimensions.dart';
import '../../../core/theme/text_styles.dart';

class OrderPlacement extends StatelessWidget {
  OrderPlacement({Key? key}) : super(key: key);

  OrderPlacementController orderPlacementController = Get.find();

  late InstrumentModel instrument;

  @override
  Widget build(BuildContext context) {
    OrderPlacementScreenArgs args = Get.arguments as OrderPlacementScreenArgs;
    instrument = args.instrument;

    double sectionVerticalMarginValue = 40;
    SizedBox sectionVerticalMargin =
        SizedBox(height: sectionVerticalMarginValue);

    return Scaffold(
        backgroundColor: AppColors.bgWhite,
        appBar: appBar(),
        body: SingleChildScrollView(
          child: Container(
            padding:
                EdgeInsets.symmetric(horizontal: Dimensions.horizontalPadding),
            child: Column(
              children: [
                sectionVerticalMargin,
                quantityAndPriceSection(),
                sectionVerticalMargin,
                productSection(),
                sectionVerticalMargin,
                AppDivider.uiDividerGray,
                sectionVerticalMargin,
                orderTypeSection(),
                sectionVerticalMargin,
                AppDivider.uiDividerGray,
                sectionVerticalMargin,
                GetBuilder<OrderPlacementController>(
                  builder: (_) => Column(
                    children: [
                      if (_.productTypeSelected[1]) leverageSection(),
                      if (_.productTypeSelected[1]) sectionVerticalMargin,
                    ],
                  ),
                ),
                stoplossSection(),
                sectionVerticalMargin,
                targetSection(),
                sectionVerticalMargin,
              ],
            ),
          ),
        ),
        bottomNavigationBar: bottomBar());
  }

  AppBar appBar() {
    return AppBar(
      elevation: 0,
      toolbarHeight: 80,
      backgroundColor: AppColors.uiGray_20,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: AppColors.uiGray_80,
        ),
      ),
      title: appBarTitle(),
    );
  }

  Widget appBarTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              instrument.instrument,
              style: AppTextStyles.h5.copyWith(color: AppColors.uiGray_80),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              instrument.getValueString(),
              style: AppTextStyles.bodyRegular.copyWith(
                  color: instrument.change >= 0
                      ? AppColors.textGreen
                      : AppColors.textRed),
            ),
          ],
        ),
        GetBuilder<OrderPlacementController>(
          builder: (controller) => Row(
            children: [
              Text(
                "Buy",
                style: AppTextStyles.bodyRegular
                    .copyWith(color: AppColors.textGray_60),
              ),
              SizedBox(
                width: 8,
              ),
              FlutterSwitch(
                width: 35.0,
                height: 17.5,
                toggleSize: 12.5,
                valueFontSize: 8.0,
                borderRadius: 10.0,
                padding: 2.0,
                activeColor: AppColors.accentRed,
                inactiveColor: AppColors.blue,
                value: !(orderPlacementController.isBuy),
                onToggle: (bool status) {
                  controller.onToggle(!status);
                },
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "Sell",
                style: AppTextStyles.bodyRegular
                    .copyWith(color: AppColors.textGray_60),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget bottomBar() {
    return Container(
      key: const ValueKey<int>(1),
      padding: EdgeInsets.symmetric(horizontal: 64, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.bgWhite,
        boxShadow: AppShadows.bottomNavShadow,
      ),
      child: GetBuilder<OrderPlacementController>(
        builder: (_) => ButtonSwipe(
          text: _.isBuy ? 'SWIPE TO BUY' : 'SWIPE TO SELL',
          color: _.isBuy ? AppColors.blue : AppColors.accentRed,
        ),
      ),
    );
  }

  Widget quantityAndPriceSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      decoration: BoxDecoration(
          boxShadow: AppShadows.cardShadowMedium,
          color: AppColors.uiWhite,
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: InputPrimary(
              labelLeft: 'Quantity',
              labelRight: 'BTC',
              inputType: TextInputType.number,
            ),
          ),
          SizedBox(
            width: 32,
          ),
          Expanded(
            flex: 1,
            child: InputPrimary(
              labelLeft: 'Price',
              labelRight: 'USDT',
              inputType: TextInputType.number,
            ),
          ),
        ],
      ),
    );
  }

  Widget productSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sectionLabel("Product"),
        const SizedBox(
          height: 24,
        ),
        GetBuilder<OrderPlacementController>(
          builder: (_) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List<Widget>.generate(
              2,
              (index) => Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: index == 0 ? 0 : 16,
                      right: index == _.productTypeList.length - 1 ? 0 : 16),
                  child: ToggleButtonPrimary(
                    text: _.productTypeList[index],
                    isSelected: _.productTypeSelected[index],
                    selectionColor:
                        _.isBuy ? AppColors.blue : AppColors.accentRed,
                    onPressed: () {
                      _.onProductTypePressed(index);
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget sectionLabel(String label) {
    return LabelPrimary(label: label);
  }

  Widget orderTypeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sectionLabel("Type"),
        const SizedBox(
          height: 24,
        ),
        GetBuilder<OrderPlacementController>(
          builder: (_) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List<Widget>.generate(
              2,
              (index) => Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: index == 0 ? 0 : 16,
                      right: index == _.orderTypeList.length - 1 ? 0 : 16),
                  child: ToggleButtonPrimary(
                    text: _.orderTypeList[index],
                    isSelected: _.orderTypeSelected[index],
                    selectionColor:
                        _.isBuy ? AppColors.blue : AppColors.accentRed,
                    onPressed: () {
                      _.onOrderTypePressed(index);
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget stoplossSection() {
    return GetBuilder<OrderPlacementController>(
      builder: (_) => ToggleSwitchInput(
        icon: Icons.show_chart,
        heading: "Set stoploss",
        label: "Stoploss %",
        color: orderPlacementController.isBuy
            ? AppColors.blue
            : AppColors.accentRed,
        inputField: InputPrimary(
          inputType: TextInputType.number,
          suffix: Icon(
            Icons.percent_rounded,
            color: AppColors.uiGray_80,
          ),
        ),
      ),
    );
  }

  Widget targetSection() {
    return GetBuilder<OrderPlacementController>(
      builder: (_) => ToggleSwitchInput(
        icon: Icons.show_chart,
        heading: "Set target",
        label: "Target %",
        color: orderPlacementController.isBuy
            ? AppColors.blue
            : AppColors.accentRed,
        inputField: const InputPrimary(
          inputType: TextInputType.number,
          suffix: Icon(
            Icons.percent_rounded,
            color: AppColors.uiGray_80,
          ),
        ),
      ),
    );
  }

  Widget leverageSection() {
    return GetBuilder<OrderPlacementController>(
        builder: (_) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OrderFormLabel(
                    label: "Leverage",
                    color: _.isBuy ? AppColors.blue : AppColors.accentRed,
                    icon: Icons.show_chart),
                LeverageSlider(
                  color: _.isBuy ? AppColors.blue : AppColors.accentRed,
                ),
              ],
            ));
  }
}
