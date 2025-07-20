import 'package:ecommerce_app/features/auth/data/models/catagory_list_model.dart';
import 'package:ecommerce_app/features/auth/ui/screens/sign_up_screen.dart';
import 'package:ecommerce_app/features/commons/ui/controller/main_bottom_nav_controller.dart';
import 'package:ecommerce_app/features/commons/ui/controller/product_list_controller.dart';
import 'package:ecommerce_app/features/commons/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.catagory});
  final CatagoryListModel catagory;
  static final String name = 'Product-list-screen';

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ProductListByCatagoryController _productListByCatagoryController =
      Get.put(ProductListByCatagoryController());
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _productListByCatagoryController.getCatagory(widget.catagory.id);
    _scrollController.addListener(_loadMoreData);
  }

  void _loadMoreData() {
    if (_scrollController.position.extentAfter < 300) {
      Get.find<ProductListByCatagoryController>().getCatagory(
        widget.catagory.id,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        Get.find<MainBottomNavScreenController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.catagory.title),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); 
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: GetBuilder<ProductListByCatagoryController>(
            init: _productListByCatagoryController,
            builder: (controller) {
              if (controller.initialLoadingInProcess) {
                return CenteredCircularProgressIndicator();
              }
              return Column(
                children: [
                  SizedBox(
                    height: 600,
                    width: 600,
                    child: GridView.builder(
                      controller: _scrollController,
                      itemCount: controller.catagoryLength,

                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 16,
                      ),
                      itemBuilder: (context, index) {
                        return FittedBox(
                          child: ProductCard(
                            productModel: controller.catagoryList[index],
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
      ),
    );
  }
}
