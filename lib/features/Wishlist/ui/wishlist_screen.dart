import 'package:ecommerce_app/features/Wishlist/controller/wish_list_controller.dart';
import 'package:ecommerce_app/features/commons/ui/controllers/main_bottom_nav_controller.dart';
import 'package:ecommerce_app/features/commons/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/core/ui/widgets/centered_circular_progress_indicator.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  static final String name = 'Wishlist-screen';

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  final WishListController _wishListController = Get.find<WishListController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _wishListController.getCatagory();
    });
  }

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
          child: GetBuilder<WishListController>(
            builder: (controller) {
              if (_wishListController.inProgress) {
                return const CenteredCircularProgressIndicator();
              }
              if (_wishListController.errorMessage != null) {
                return Center(child: Text(_wishListController.errorMessage!));
              }

              return Expanded(
                child: GridView.builder(
                  itemCount: controller.catagoryLength,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return FittedBox(
                      child: ProductCard(
                        productModel: controller.catagoryList[index],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
