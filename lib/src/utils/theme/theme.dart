// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.yellow,
      dialogBackgroundColor: Color.fromRGBO(255, 241, 118, 1),
      cardColor: Colors.yellow[200],
      canvasColor: Colors.grey[600],
      textTheme: TextTheme(
          displayLarge: TextStyle(
            color: Colors.black87,
          ),
          displayMedium: TextStyle(color: Colors.black87),
          displaySmall: TextStyle(color: Colors.black87)));

  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      canvasColor: Colors.white70,
      textTheme: TextTheme(
          displayLarge: TextStyle(
        color: Colors.white70,
      )));
}
