import 'package:flutter/material.dart';
import 'package:flutter_control/core.dart';

class NazevMojehoTheme extends ControlTheme {
  NazevMojehoTheme([BuildContext? context]) : super(context);

  ThemeData get defaultTheme => ThemeData(
        primaryColor: primaryColor,
        accentColor: accentColor,
        backgroundColor: backgroundColor,
        textTheme: textTheme,
      );
  @override
  Color get primaryColor => Color(0xFFFFFFFF);
  @override
  Color get accentColor => Color(0xFF000000);
  @override
  Color get backgroundColor => Color(0xFF00BCD4);
  @override
  TextTheme get textTheme => TextTheme(headline1: textvar);
  static TextStyle get textvar => TextStyle();
}
