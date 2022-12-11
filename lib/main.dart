import 'package:futurecoin/core/constants/strings.dart';
import 'package:futurecoin/modules/order_placement/order_placement_binding.dart';
import 'package:futurecoin/routes/app_pages.dart';
import 'package:futurecoin/core/theme/app_theme.dart';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import 'modules/main/app_main_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appName,
      theme: themeData,
      locale: const Locale('en', 'IN'),
      getPages: AppPages.routes,
      initialRoute: AppPages.INITIAL,
      initialBinding: AppMainBinding(),
      // unknownRoute: GetPage(name: '/notfound', page: () => UnknownRoutePage()),
      defaultTransition: Transition.fade,
      // locale: Locale(_languageStore.locale),
    );
  }
}
