import 'package:flutter/material.dart';

import 'theme.dart';

class LightTheme extends MyTheme {
  @override
  Color get primaryColor => const Color(0xFF0B4AAA);

  @override
  Color get secondaryColor1 => const Color(0xFFF0EFEF);

  @override
  ColorScheme? get colorScheme => ColorScheme.fromSeed(
    seedColor: primaryColor,
  );

  @override
  TextTheme get textTheme => lightTextTheme.copyWith(
    bodyText1: bodyText1.copyWith(
      color: Colors.grey.shade800,
    ).merge(baseTextStyle),
    headline1: headline1.copyWith(
      color: Colors.grey.shade900,
    ).merge(baseTextStyle),
    headline3: headline3.copyWith(
      color: Colors.grey.shade900,
    ).merge(baseTextStyle),
  );

  @override
  ThemeData get themeData => ThemeData.light().copyWith(
    appBarTheme: appBarTheme,

    colorScheme: colorScheme,
    dialogTheme: dialogTheme,
    errorColor: errorColor,

    dividerTheme: dividerTheme.copyWith(
      color: Colors.grey.shade600,
    ),

    inputDecorationTheme: inputDecorationTheme.copyWith(
      fillColor: const Color(0xFFEEEEEE)
    ),

    snackBarTheme: snackBarTheme,
    textTheme: textTheme,
    primaryTextTheme: primaryTextTheme,
  );
}
