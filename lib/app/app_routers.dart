import 'package:ecommerce_app/features/auth/ui/screens/home_screen.dart';
import 'package:ecommerce_app/features/auth/ui/screens/login_screen.dart';
import 'package:ecommerce_app/features/auth/ui/screens/main_buttom_nav_screen.dart';
import 'package:ecommerce_app/features/auth/ui/screens/product_catagory_screen.dart';
import 'package:ecommerce_app/features/auth/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouters {
  static Route<dynamic> getRoute(RouteSettings settings) {
    late final Widget screenWidget;
    if (settings.name == SplashScreen.name) {
      screenWidget = SplashScreen();
    } else if (settings.name == LoginScreen.name) {
      screenWidget = LoginScreen();
    }
    // else if (settings.name == HomeScreen.name) {
    //   screenWidget = HomeScreen();
    // } else if (settings.name == ProductCatagoryScreen.name) {
    //   screenWidget = ProductCatagoryScreen();
    // }
    else if (settings.name == MainButtomNavScreen.name) {
      screenWidget = MainButtomNavScreen();
    }
    // else if (settings.name == ProductCatagoryScreen.name) {
    //   screenWidget = ProductCatagoryScreen();
    // }
    return MaterialPageRoute(
      builder: (context) {
        return screenWidget;
      },
    );
  }
}
