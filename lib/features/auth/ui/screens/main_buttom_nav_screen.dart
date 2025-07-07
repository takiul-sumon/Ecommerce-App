import 'package:ecommerce_app/features/auth/ui/controller/main_bottom_nav_controller.dart';
import 'package:ecommerce_app/features/home/ui/screans/home_screen.dart';
import 'package:ecommerce_app/features/auth/ui/screens/product_catagory_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MainButtomNavScreen extends StatefulWidget {
  const MainButtomNavScreen({super.key});
  static final String name = '/main-bottom-nav';

  @override
  State<MainButtomNavScreen> createState() => _MainButtomNavScreenState();
}

class _MainButtomNavScreenState extends State<MainButtomNavScreen> {
  List<Widget> screens = [
    HomeScreen(),
    ProductCatagoryScreen(),
    ProductCatagoryScreen(),
    ProductCatagoryScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavScreenController>(
      builder: (navController) {
        return Scaffold(
          body: screens[navController.selectedIndex],
          bottomNavigationBar: NavigationBar(
            selectedIndex: navController.selectedIndex,
            onDestinationSelected: navController.changeIndex,
            destinations: [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(
                icon: Icon(Icons.category_outlined),
                label: 'Catagory',
              ),
              NavigationDestination(
                icon: Icon(Icons.shopping_cart),
                label: 'Cart',
              ),
              NavigationDestination(
                icon: Icon(Icons.favorite_outline_rounded),
                label: 'Wishlist',
              ),
            ],
          ),
        );
      },
    );
  }
}
