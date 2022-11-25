import 'dart:ui';

import 'package:flutter/material.dart';

import 'colors.dart';
import 'font_family.dart';

/// Colour Creation:
/// In order to create the custom colours you need to create a `Map<int, Color>` object
/// which will have all the shade values. `const Color(0xFF...)` will be how you create
/// the colours. The six character hex code is what follows. If you wanted the colour
/// #114488 or #D39090 as primary colours in your theme, then you would have
/// `const Color(0x114488)` and `const Color(0xD39090)`, respectively.

/// TEXT STYLE BEST PRACTICE
/// try to limit its use to the definition of
/// colors, decoration, weight
///
/// try to avoid hardcoding:
/// fontSize, fontFamily, letterSpacing
///
/// instead use: Theme.of(context).textTheme.heading6.copyWith(color: orange) etc.

TextTheme textTheme = const TextTheme(
  headline1:
      TextStyle(fontSize: 40, height: 40, fontWeight: FontWeight.w600),
  headline2:
      TextStyle(fontSize: 32, height: 36, fontWeight: FontWeight.w600),
  headline3:
      TextStyle(fontSize: 28, height: 32, fontWeight: FontWeight.w600),
  headline4:
      TextStyle(fontSize: 20, height: 24, fontWeight: FontWeight.w600),
  headline5:
      TextStyle(fontSize: 16, height: 24, fontWeight: FontWeight.w600),
  headline6:
      TextStyle(fontSize: 12, height: 12, fontWeight: FontWeight.w600),
);

final ThemeData themeData =  ThemeData(
  ///TEXT
  textTheme: textTheme,
  fontFamily: FontFamily.lato,

  ///BRIGHTNESS
  brightness: Brightness.light,

  ///COLORS
  primaryColor: AppColors.primaryColor,
  scaffoldBackgroundColor: AppColors.bgWhite,

  ///APP THEME
  // appBarTheme: const AppBarTheme(
  //   foregroundColor: Colors.white,
  //   backgroundColor: Colors.black,
  // ),
);

final ThemeData themeDataDark = ThemeData(
  fontFamily: FontFamily.lato,
  brightness: Brightness.dark,
);
