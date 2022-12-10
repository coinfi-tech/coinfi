import 'dart:developer';

import 'package:coinfi/core/theme/colors.dart';
import 'package:coinfi/core/theme/shadows.dart';
import 'package:coinfi/core/utils/AppFormatter.dart';
import 'package:coinfi/data/models/instrument_model.dart';
import 'package:coinfi/modules/global_widgets/buttons/button_swipe.dart';
import 'package:coinfi/modules/global_widgets/buttons/toggle_button_primary.dart';
import 'package:coinfi/modules/global_widgets/divider/divider.dart';
import 'package:coinfi/modules/global_widgets/input/input_primary.dart';
import 'package:coinfi/modules/global_widgets/input/label_primary.dart';
import 'package:coinfi/modules/main/market/state/market_data/market_data_controller.dart';
import 'package:coinfi/modules/order_placement/args/order_placement_screen_args.dart';
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
  MarketDataController marketDataController = Get.find();

  @override
  Widget build(BuildContext context) {
    double sectionVerticalMarginValue = 16;
    SizedBox sectionVerticalMargin =
        SizedBox(height: sectionVerticalMarginValue);

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.bgWhite,
        appBar: appBar(),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Container(
            padding:
                EdgeInsets.symmetric(horizontal: Dimensions.horizontalPadding),
            child: Column(
              children: [
                sectionVerticalMargin,
                quantityAndPriceSection(),
                sectionVerticalMargin,
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
                sectionVerticalMargin,
                targetSection(),
                sectionVerticalMargin,
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: bottomBar(),
        ),
      ),
    );
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
              orderPlacementController.instrument.instrument,
              style: AppTextStyles.h5.copyWith(color: AppColors.uiGray_80),
            ),
            SizedBox(
              height: 8,
            ),
            Obx(() {
              InstrumentModel instrumentStream = marketDataController
                  .instrumentMap[orderPlacementController.instrument.instrument
                      .toLowerCase()]!
                  .value;
              return Text(
                AppFormatter.formatCurrencyINR(instrumentStream.price),
                style: AppTextStyles.bodyRegular.copyWith(
                    color: instrumentStream.change >= 0
                        ? AppColors.textGreen
                        : AppColors.textRed),
              );
            }),
          ],
        ),
        GetBuilder<OrderPlacementController>(
          builder: (controller) => Row(
            children: [
              Text(
                "Buy",
                style:
                    AppTextStyles.body14.copyWith(color: AppColors.textGray_60),
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
                activeColor: AppColors.sellColor,
                inactiveColor: AppColors.buyColor,
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
    return IntrinsicHeight(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.uiGray_20,
            ),
            padding: EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GetBuilder<OrderPlacementController>(
                  builder: (_) {
                    return Text(
                      "Total Order Val. ${AppFormatter.formatCurrencyINR(orderPlacementController.totalOrderValue)}",
                      style: AppTextStyles.bodySmall
                          .copyWith(color: AppColors.textGray_70),
                    );
                  },
                ),
                Text(
                  "Bal. ${AppFormatter.formatCurrencyINR(10000001)}",
                  style: AppTextStyles.bodySmall
                      .copyWith(color: AppColors.textGray_70),
                ),
              ],
            ),
          ),
          Container(
            key: const ValueKey<int>(1),
            padding: EdgeInsets.symmetric(horizontal: 64, vertical: 16),
            decoration: BoxDecoration(
              color: AppColors.bgWhite,
              boxShadow: AppShadows.bottomNavShadow,
            ),
            child: GetBuilder<OrderPlacementController>(
              builder: (_) => ButtonSwipe(
                text: _.isBuy ? 'SWIPE TO BUY' : 'SWIPE TO SELL',
                color: _.isBuy ? AppColors.buyColor : AppColors.sellColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget quantityAndPriceSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
          boxShadow: AppShadows.cardShadowMedium,
          color: AppColors.uiWhite,
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 1,
              child: GetBuilder<OrderPlacementController>(
                builder: (_) => InputPrimary(
                  labelLeft: 'Quantity',
                  labelRight: orderPlacementController.instrument.instrument,
                  inputType: TextInputType.number,
                  focusedColor:
                      _.isBuy ? AppColors.buyColor : AppColors.sellColor,
                  textEditingController:
                      orderPlacementController.quantityInputController,
                  onChanged: orderPlacementController.onQuantityChanged,
                ),
              )),
          SizedBox(
            width: 16,
          ),
          Expanded(
            flex: 1,
            child: GetBuilder<OrderPlacementController>(
              builder: (_) => InputPrimary(
                labelLeft: 'Price',
                labelRight: 'INR',
                inputType: TextInputType.number,
                focusedColor:
                    _.isBuy ? AppColors.buyColor : AppColors.sellColor,
                enabled: _.orderTypeSelected[1],
                textEditingController:
                    orderPlacementController.priceInputController,
                onChanged: orderPlacementController.onPriceChanged,
              ),
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
          height: 16,
        ),
        GetBuilder<OrderPlacementController>(
          builder: (_) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List<Widget>.generate(
              2,
              (index) => Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: index == 0 ? 0 : 8,
                      right: index == _.productTypeList.length - 1 ? 0 : 8),
                  child: ToggleButtonPrimary(
                    text: _.productTypeList[index],
                    isSelected: _.productTypeSelected[index],
                    selectionColor:
                        _.isBuy ? AppColors.buyColor : AppColors.sellColor,
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
        sectionLabel("Order type"),
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
                      left: index == 0 ? 0 : 8,
                      right: index == _.orderTypeList.length - 1 ? 0 : 8),
                  child: ToggleButtonPrimary(
                    text: _.orderTypeList[index],
                    isSelected: _.orderTypeSelected[index],
                    selectionColor:
                        _.isBuy ? AppColors.buyColor : AppColors.sellColor,
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
            ? AppColors.buyColor
            : AppColors.sellColor,
        inputField: GetBuilder<OrderPlacementController>(
          builder: (_) => InputPrimary(
            inputType: TextInputType.number,
            suffix: const Icon(
              Icons.percent_rounded,
              color: AppColors.uiGray_80,
            ),
            focusedColor: _.isBuy ? AppColors.buyColor : AppColors.sellColor,
            textEditingController:
                orderPlacementController.stopLossInputController,
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
            ? AppColors.buyColor
            : AppColors.sellColor,
        inputField: GetBuilder<OrderPlacementController>(
          builder: (_) => InputPrimary(
            inputType: TextInputType.number,
            suffix: const Icon(
              Icons.percent_rounded,
              color: AppColors.uiGray_80,
            ),
            focusedColor: _.isBuy ? AppColors.buyColor : AppColors.sellColor,
            textEditingController:
                orderPlacementController.targetInputController,
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
                    color: _.isBuy ? AppColors.buyColor : AppColors.sellColor,
                    icon: Icons.show_chart),
                LeverageSlider(
                  color: _.isBuy ? AppColors.buyColor : AppColors.sellColor,
                ),
              ],
            ));
  }
}
