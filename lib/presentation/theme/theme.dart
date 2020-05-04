import 'package:contacts_flutter/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: colorPrimary,
  accentColor: colorPrimary,
  primaryColorDark: colorPrimaryDark,
  textTheme: TextTheme(
    headline5: TextStyle(fontSize: 20.0, color: colorTextPrimary),
    bodyText1: TextStyle(
      fontSize: 16.0,
      color: colorTextPrimary,
      fontWeight: FontWeight.normal,
    ),
    bodyText2: TextStyle(fontSize: 14.0, color: colorTextPrimary),
    subtitle1: TextStyle(fontSize: 14.0, color: colorTextSecondary),
  ),
);
