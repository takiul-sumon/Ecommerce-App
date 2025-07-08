import 'package:ecommerce_app/features/commons/ui/controller/main_bottom_nav_controller.dart';
import 'package:ecommerce_app/features/home/ui/screans/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class ProductCatagoryScreen extends StatefulWidget {
  const ProductCatagoryScreen({super.key});

  @override
  State<ProductCatagoryScreen> createState() => _ProductCatagoryScreenState();
}

class _ProductCatagoryScreenState extends State<ProductCatagoryScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        Get.find<MainBottomNavScreenController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavScreenController>().backToHome();
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Text(
            'Catagories',
            style: Theme.of(
              context,
            ).textTheme.bodyLarge!.copyWith(color: Colors.black87),
          ),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 8,
            crossAxisSpacing: 2,
          ),
          itemBuilder: (context, index) {
            return CatagoryWiseProduct(
              icon: Icons.computer,
              prodcutTitle: 'Electronics',
            );
          },
        ),
      ),
    );
  }
}

// Get.find<MainBottomNavScreenController>().backToHome();
