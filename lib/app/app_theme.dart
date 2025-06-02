import 'package:ecommerce_app/app/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightThemeData {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: AppColor.getMaterialColor(AppColor.themeColor),
      ),
      textTheme: textTheme,
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        enabledBorder: outLineInputBorder(AppColor.themeColor),
        focusedBorder: outLineInputBorder(AppColor.themeColor),
        border: outLineInputBorder(AppColor.themeColor),
        errorBorder: outLineInputBorder(Colors.red),
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.black38,
          fontSize: 16,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal[700],
          shape: RoundedRectangleBorder(),
        ),
      ),
    );
  }

  static OutlineInputBorder outLineInputBorder(Color color) {
    return OutlineInputBorder(borderSide: BorderSide(color: color, width: 2.0));
  }

  static TextTheme get textTheme {
    return TextTheme(
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 28,
        color: Colors.black54,
      ),
      bodyMedium: TextStyle(fontSize: 12, color: Colors.black45),
    );
  }
}
