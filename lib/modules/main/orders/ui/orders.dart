import 'package:coinfi/core/theme/colors.dart';
import 'package:coinfi/core/theme/dimensions.dart';
import 'package:coinfi/core/theme/text_styles.dart';
import 'package:coinfi/data/models/order_model.dart';
import 'package:coinfi/modules/global_widgets/divider/divider.dart';
import 'package:coinfi/modules/global_widgets/icons/app_icons.dart';
import 'package:coinfi/modules/main/orders/state/orders/orders_controller.dart';
import 'package:coinfi/modules/main/orders/ui/widgets/order_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Orders extends StatelessWidget {
  Orders({Key? key}) : super(key: key);

  OrdersController ordersController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
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
          for (OrderModel order in ordersController.orderList)
            Column(
              children: [
                OrderTile(order: order),
                AppDivider.uiDividerGray_30,
              ],
            ),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      centerTitle: false,
      elevation: 0,
      toolbarHeight: 60,
      backgroundColor: AppColors.appBarBackgroundColor,
      title: Text(
        "Orders",
        style: AppTextStyles.appBarHeading.copyWith(color: AppColors.textWhite),
      ),
    );
  }
}
