import 'package:ecommerce_app/features/auth/ui/widgets/app_logo.dart';
import 'package:ecommerce_app/features/commons/ui/screens/main_buttom_nav_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static final String name = '/splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
    // Get.find<AuthController>().isUserLoggedIn();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(Duration(seconds: 2));

    Navigator.pushReplacementNamed(context, MainButtomNavScreen.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Applogo(),
              Spacer(),
              CircularProgressIndicator(),
              SizedBox(height: 5),
              Text('Version 1.0.0'),
            ],
          ),
        ),
      ),
    );
  }
}
