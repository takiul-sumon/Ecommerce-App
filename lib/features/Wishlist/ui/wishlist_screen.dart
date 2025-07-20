import 'package:ecommerce_app/features/commons/ui/controller/main_bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  static final String name = 'Wishlist-screen';

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        Get.find<MainBottomNavScreenController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('WishList'),
          leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavScreenController>().backToHome();
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              // return FittedBox(child: ProductCard());
            },
          ),
        ),
      ),
    );
  }
}
