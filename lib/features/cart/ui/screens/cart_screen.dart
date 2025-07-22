import 'package:ecommerce_app/app/app_color.dart';
import 'package:ecommerce_app/features/Product/ui/Widget/inc_dec_button.dart';
import 'package:ecommerce_app/features/cart/data/models/cart_item_model.dart';
import 'package:ecommerce_app/features/cart/ui/controllers/cart_item_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/core/ui/widgets/centered_circular_progress_indicator.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartListController _cartListController = Get.find<CartListController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _cartListController.getCartItemList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: GetBuilder(
        init: _cartListController,
        builder: (_) {
          if (_cartListController.inProgress) {
            return const CenteredCircularProgressIndicator();
          }
          if (_cartListController.errorMessage != null) {
            return Center(child: Text(_cartListController.errorMessage!));
          }
          return Column(
            children: [
              SizedBox(
                height: 600,
                child: ListView.builder(
                  itemCount: _cartListController.cartItemList.length,
                  itemBuilder: (context, index) {
                    return ProductDetailsForCheckOut(
                      cartItemModel: _cartListController.cartItemList[index],
                    );
                  },
                ),
              ),
              buildPriceAndAddToCart(),
            ],
          );
        },
      ),
    );
  }

  Widget buildPriceAndAddToCart() {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: AppColor.themeColor.withOpacity(.2),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Price',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  _cartListController.totalPrice.toString(),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColor.themeColor,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(8),
                ),
              ),
              child: Text('Check Out', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDetailsForCheckOut extends StatelessWidget {
  const ProductDetailsForCheckOut({super.key, required this.cartItemModel});
  final CartItemModel cartItemModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 110,
        child: Card(
          elevation: 5,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 100,
                padding: EdgeInsets.all(8),
                child: Image.network(
                  cartItemModel.productModel.photos.first,
                  errorBuilder: (_, __, ___) {
                    return Center(child: Icon(Icons.error_outline));
                  },
                  fit: BoxFit.scaleDown,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'New Year Special Shoe',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Color Red Size X',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),

                    Text(
                      cartItemModel.productModel.currentPrice.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColor.themeColor,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.delete),
                  SizedBox(height: 20),
                  IncDecButton(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
