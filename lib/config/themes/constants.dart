import 'package:flutter/widgets.dart';

abstract class ThemeConstants {
  TextStyle get bodyText1 => const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16.0,
  );

  TextStyle get headline1 => const TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.w500,
  );

  TextStyle get headline3 => const TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w500,
  );
}
