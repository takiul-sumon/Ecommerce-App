import 'package:ecommerce_app/features/cart/ui/screens/cart_screen.dart';
import 'package:ecommerce_app/features/Wishlist/ui/wishlist_screen.dart';
import 'package:ecommerce_app/features/commons/controller/catagory_Controller.dart';
import 'package:ecommerce_app/features/auth/ui/controller/popular_product_list_controller.dart';
import 'package:ecommerce_app/features/auth/ui/controller/slider_controller.dart';
import 'package:ecommerce_app/features/auth/ui/controller/special_product_list_controller.dart';
import 'package:ecommerce_app/features/Wishlist/controller/wish_list_controller.dart';
import 'package:ecommerce_app/features/commons/ui/controllers/main_bottom_nav_controller.dart';
import 'package:ecommerce_app/features/home/ui/screans/home_screen.dart';
import 'package:ecommerce_app/features/Product/ui/screans/product_catagory_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    CartScreen(),
    WishListScreen(),
  ];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<SliderController>().getSlider();
      Get.find<CatagoryListController>().getCatagory();
      Get.find<SpecialProductListController>().getSpecialProduct();
      Get.find<PopularProductListController>().getPopularProduct();
      Get.find<WishListController>().getCatagory();
    });
  }

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
