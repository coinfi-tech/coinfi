import 'package:futurecoin/core/theme/colors.dart';
import 'package:futurecoin/core/theme/text_styles.dart';
import 'package:futurecoin/modules/main/account/ui/widgets/user_card.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'widgets/account_tile.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: UserCard(),
              ),
              AccountTile(title: "Funds", icon: Icons.currency_rupee),
              AccountTile(title: "Profile", icon: Icons.person_outline),
              AccountTile(title: "Settings", icon: Icons.settings_outlined),
              AccountTile(
                  title: "Invite friends", icon: Icons.person_add_alt_outlined),
              AccountTile(title: "Support", icon: Icons.info_outline),
              AccountTile(title: "T&C", icon: Icons.description_outlined),
              AccountTile(title: "Logout", icon: Icons.logout_outlined),
              SizedBox(
                height: 16,
              ),
              Column(
                children: [
                  Text(
                    "futurecoin",
                    style: AppTextStyles.h3.copyWith(
                        color: AppColors.textGray_40,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "Version 1.0.0",
                    style: AppTextStyles.body14.copyWith(
                        color: AppColors.textGray_60,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
      appBar: appBar(),
    );
  }

  AppBar appBar() {
    return AppBar(
      centerTitle: false,
      elevation: 0,
      toolbarHeight: 60,
      backgroundColor: AppColors.appBarBackgroundColor,
      title: Text(
        "Account",
        style: AppTextStyles.appBarHeading.copyWith(color: AppColors.textWhite),
      ),
    );
  }
}
