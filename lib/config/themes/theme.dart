import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

abstract class MyTheme extends ThemeConstants {
  // theme data of current theme.
  // needs to be overriden by the sub-class.
  ThemeData get themeData;

  // Colors - Primary Color
  Color? get primaryColor;

  // Colors - Primary Color compatible color
  Color? get secondaryColor1;

  // Colors - Primary Color compatible color 2
  Color? get secondaryColor2 => null;

  // Colors - Primary Color compatible color 2
  Color? get secondaryColor3 => null;

  // Colors Scheme
  ColorScheme? get colorScheme => null;

  // Colors - Error Message Color
  @protected
  Color get errorColor => Colors.redAccent;

  @protected
  TextStyle get baseTextStyle => GoogleFonts.poppins();

  // App Text Theme needs to be overridden
  TextTheme get textTheme;
  TextTheme get primaryTextTheme => textTheme;

  @protected
  TextTheme get lightTextTheme => ThemeData.light().textTheme.apply(
    fontFamily: baseTextStyle.fontFamily,
  );

  @protected
  TextTheme get darkTextTheme => ThemeData.dark().textTheme.apply(
    fontFamily: baseTextStyle.fontFamily,
  );

  // App Bar
  @protected
  AppBarTheme get appBarTheme => AppBarTheme(
    actionsIconTheme: actionsIconTheme,
    titleTextStyle: titleTextStyle,
    toolbarTextStyle: toolbarTextStyle,
  );

  @protected
  IconThemeData get actionsIconTheme => const IconThemeData();

  @protected
  TextStyle get titleTextStyle => baseTextStyle.copyWith(
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
  );

  @protected
  TextStyle get toolbarTextStyle => baseTextStyle.copyWith(
    fontSize: 14.0,
  );

  // Global theme getters
  @protected
  BottomNavigationBarThemeData get bottomNavigationBarTheme => BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedLabelStyle: baseTextStyle.copyWith(
      fontSize: 11.0,
      fontWeight: FontWeight.w500,
    ),
    unselectedLabelStyle: baseTextStyle.copyWith(
      fontSize: 11.0,
      fontWeight: FontWeight.w500,
    ),
  );

  @protected
  DialogTheme get dialogTheme => const DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
  );

  @protected
  DividerThemeData get dividerTheme => const DividerThemeData(
    indent: 16.0,
    endIndent: 16.0,
  );

  @protected
  InputDecorationTheme get inputDecorationTheme => const InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
    ),
    filled: true,
  );

  @protected
  SnackBarThemeData get snackBarTheme => const SnackBarThemeData(
    behavior: SnackBarBehavior.floating,
    actionTextColor: Colors.purple,
  );
}
