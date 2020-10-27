import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider =
    StateNotifierProvider<ThemeProvider>((_) => ThemeProvider());

class ThemeProvider extends StateNotifier<bool> {
  ThemeProvider() : super(true);

  void switchTheme() {
    state = !state;
  }
}

final darkTheme = ThemeData(
  fontFamily: "Poppins",
  backgroundColor: Colors.black,
  primaryColor: const Color(0xFF1E1E1E),
  accentColor: Colors.white,
  iconTheme: IconThemeData(color: Colors.white),
  textTheme: TextTheme(
    headline6: TextStyle(
      color: Colors.white,
      fontSize: 60,
      fontWeight: FontWeight.w700,
      letterSpacing: 1,
    ),
    caption: TextStyle(
      color: Colors.white70,
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ),
    headline2: TextStyle(
      color: Colors.white,
      fontSize: 40,
      fontWeight: FontWeight.w600,
      letterSpacing: 1,
    ),
    bodyText1: TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.w400,
    ),
    bodyText2: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ),
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

final lightTheme = ThemeData(
  fontFamily: "Poppins",
  backgroundColor: Colors.white54,
  primaryColor: const Color(0xFFCFCFCF),
  accentColor: Colors.black,
  iconTheme: IconThemeData(color: Colors.black),
  textTheme: TextTheme(
    headline6: TextStyle(
      color: Colors.black,
      fontSize: 60,
      fontWeight: FontWeight.w800,
      letterSpacing: 1,
    ),
    caption: TextStyle(
      color: Colors.white70,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    headline2: TextStyle(
      color: Colors.black,
      fontSize: 40,
      fontWeight: FontWeight.w800,
      letterSpacing: 1,
    ),
    bodyText1: TextStyle(
      color: Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.w700,
    ),
    bodyText2: TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
