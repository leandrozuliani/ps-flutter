import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  primaryColor: const  Color(0xFF2E91FE),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: const Color(0xFFECF4FF),
  ),

  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'OpenSans',
      fontSize: 24,
      color: Colors.white,
    ),
    titleMedium: TextStyle(
      fontFamily: 'OpenSansLight',
      fontSize: 16,
      color: Color(0xFFDFE9F7),
    ),
    bodyMedium: TextStyle(
      fontFamily: 'OpenSans',
      fontSize: 15,
      color: Color(0xFFECF4FF),
    ),
    headlineMedium: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 22,
      color: Colors.white,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 13,
      color: Color(0xFFECF4FF),
    ),
  ),
);
