import 'package:flutter/material.dart';

import 'theme.dart';

class DarkTheme extends MyTheme {
  @override
  Color? get primaryColor => null;

  @override
  Color? get secondaryColor1 => null;

  @override
  TextTheme get textTheme => darkTextTheme.copyWith(
    bodyText1: bodyText1.copyWith(
      color: Colors.white,
    ).merge(baseTextStyle),
    headline1: headline1.copyWith(
      color: Colors.white,
    ).merge(baseTextStyle),
    headline3: headline3.copyWith(
      color: Colors.white,
    ).merge(baseTextStyle),
  );

  @override
  TextStyle get titleTextStyle => super.titleTextStyle.copyWith(
    color: primaryColor,
  );

  @override
  ThemeData get themeData => ThemeData.dark().copyWith(
    appBarTheme: appBarTheme,
    bottomNavigationBarTheme: bottomNavigationBarTheme,
    errorColor: errorColor,
    dialogTheme: dialogTheme,
    dividerTheme: dividerTheme,
    inputDecorationTheme: inputDecorationTheme,
    snackBarTheme: snackBarTheme,
    textTheme: textTheme,
    primaryTextTheme: primaryTextTheme,
  );
}
