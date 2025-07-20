import 'package:ecommerce_app/features/Product/ui/screans/prodcut_list_screens.dart';
import 'package:ecommerce_app/features/Product/ui/screans/product_details.dart';
import 'package:ecommerce_app/features/auth/data/models/catagory_list_model.dart';
import 'package:ecommerce_app/features/auth/ui/screens/login_screen.dart';
import 'package:ecommerce_app/features/auth/ui/screens/verify_otp_screen.dart';
import 'package:ecommerce_app/features/commons/ui/screens/main_buttom_nav_screen.dart';
import 'package:ecommerce_app/features/auth/ui/screens/sign_up_screen.dart';
import 'package:ecommerce_app/features/auth/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouters {
  static Route<dynamic> getRoute(RouteSettings settings) {
    late final Widget screenWidget;
    if (settings.name == SplashScreen.name) {
      screenWidget = SplashScreen();
    } else if (settings.name == LoginScreen.name) {
      screenWidget = LoginScreen();
    } else if (settings.name == SignUpScreen.name) {
      screenWidget = SignUpScreen();
    } else if (settings.name == MainButtomNavScreen.name) {
      screenWidget = MainButtomNavScreen();
    } else if (settings.name == ProductListScreen.name) {
      final CatagoryListModel catagory = settings.arguments as CatagoryListModel;
      screenWidget = ProductListScreen(catagory: catagory);
    } else if (settings.name == ProductDetailsScreen.name) {
      final String catagory = settings.arguments as String;
      screenWidget = ProductDetailsScreen(productid: catagory);
    } else if (settings.name == VerifyOtpScreen.name) {
      final String email = settings.arguments as String;
      screenWidget = VerifyOtpScreen(emailAddress: email);
    }

    return MaterialPageRoute(
      builder: (context) {
        return screenWidget;
      },
    );
  }
}
