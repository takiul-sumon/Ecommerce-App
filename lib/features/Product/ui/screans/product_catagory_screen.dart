import 'package:ecommerce_app/features/commons/controller/catagory_Controller.dart';
import 'package:ecommerce_app/features/commons/ui/controllers/main_bottom_nav_controller.dart';
import 'package:ecommerce_app/features/commons/widgets/product_catagory.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:ecommerce_app/core/ui/widgets/centered_circular_progress_indicator.dart';

class ProductCatagoryScreen extends StatefulWidget {
  const ProductCatagoryScreen({super.key});

  @override
  State<ProductCatagoryScreen> createState() => _ProductCatagoryScreenState();
}

class _ProductCatagoryScreenState extends State<ProductCatagoryScreen> {
  final ScrollController _scrollController = ScrollController();
  final CatagoryListController _categoryListController =
      Get.find<CatagoryListController>();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadMoreData);
  }

  void _loadMoreData() {
    if (_scrollController.position.extentAfter < 300) {
      _categoryListController.getCatagory();
    }
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
        body: GetBuilder<CatagoryListController>(
          builder: (controller) {
            if (controller.initialLoadingInProcess) {
              return CenteredCircularProgressIndicator();
            }
            return Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    controller: _scrollController,
                    itemCount: controller.catagoryList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 2,
                    ),
                    itemBuilder: (context, index) {
                      return FittedBox(
                        child: CatagoryWiseProduct(
                          catagory: controller.catagoryList[index],
                        ),
                      );
                    },
                  ),
                ),
                Visibility(
                  visible: controller.inProgress,
                  child: LinearProgressIndicator(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

// Get.find<MainBottomNavScreenController>().backToHome();
