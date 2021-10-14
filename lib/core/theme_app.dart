import 'package:flutter/material.dart';

final themeApp = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primarySwatch: Colors.indigo,
  buttonTheme: const ButtonThemeData(
    height: 50,
    textTheme: ButtonTextTheme.primary,
  ),
);