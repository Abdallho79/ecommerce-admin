import 'package:flutter/material.dart';
import 'package:admin/core/Constant/Color_Const.dart';

class Themes {
  static ThemeData themeEnglish = ThemeData(
    appBarTheme: AppBarTheme(
        backgroundColor: AppColor.primaryColor,
        // color: Colors.grey[50],
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25)),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColor.primaryColor),
    fontFamily: "PlayfairDisplay",
    textTheme: const TextTheme(
        displayMedium: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 22, color: AppColor.black),
        displayLarge: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 26, color: AppColor.black),
        bodyLarge: TextStyle(
            height: 2,
            color: AppColor.grey,
            fontWeight: FontWeight.bold,
            fontSize: 14),
        bodyMedium: TextStyle(height: 2, color: AppColor.grey, fontSize: 14)),
    primarySwatch: Colors.blue,
  );

  static ThemeData themeArabic = ThemeData(
    appBarTheme: AppBarTheme(
        backgroundColor: AppColor.primaryColor,

        // color: Colors.grey[50],
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25)),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColor.primaryColor),
    fontFamily: "Cairo",
    textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 22, color: AppColor.black),
        displayMedium: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 26, color: AppColor.black),
        bodyLarge: TextStyle(
            height: 2,
            color: AppColor.grey,
            fontWeight: FontWeight.bold,
            fontSize: 14),
        bodyMedium: TextStyle(height: 2, color: AppColor.grey, fontSize: 14)),
    primarySwatch: Colors.blue,
  );
}
