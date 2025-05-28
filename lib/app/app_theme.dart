import 'package:ecommerce_app/app/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightThemeData {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: AppColor.getMaterialColor(AppColor.themeColor),
      ),
    );
  }
}
