import 'package:ecommerce_app/features/auth/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouters {
  static Route<dynamic> getRoute(RouteSettings settings) {
      late final Widget screenWidget;
        if (settings.name == SplashScreen.name) {
          screenWidget = SplashScreen();
        }
        return MaterialPageRoute(
          builder: (context) {
            return screenWidget;
          },
        );
  }
}
