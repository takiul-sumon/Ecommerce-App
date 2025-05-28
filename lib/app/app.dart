import 'package:ecommerce_app/app/app_routers.dart';
import 'package:ecommerce_app/app/app_theme.dart';
import 'package:ecommerce_app/features/auth/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightThemeData,
      initialRoute: SplashScreen.name,
      onGenerateRoute: AppRouters.getRoute,
    );
  }
}
