import 'package:ecommerce_app/app/app_color.dart';
import 'package:ecommerce_app/features/Product/ui/Widget/inc_dec_button.dart';
import 'package:ecommerce_app/features/Product/ui/Widget/product_image_slider.dart';
import 'package:ecommerce_app/features/Product/controller/add_to_cart_controller.dart';
import 'package:ecommerce_app/features/commons/controller/auth_controller.dart';
import 'package:ecommerce_app/features/Product/controller/product_details_controller.dart';
import 'package:ecommerce_app/features/auth/ui/screens/login_screen.dart';
import 'package:ecommerce_app/core/ui/sncak_bar_messenger.dart';
import 'package:ecommerce_app/features/commons/model/product_details_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/core/ui/widgets/centered_circular_progress_indicator.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productid});

  final String productid;
  static const String name = '/product-details';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final ProductDetailsController _productDetailsController =
      Get.find<ProductDetailsController>();
  final AddToCartController _addToCartController =
      Get.find<AddToCartController>();
  @override
  void initState() {
    super.initState();
    _productDetailsController.getProductDetails(widget.productid);
  }

  Future<void> _onTapAddToCartButton() async {
    if (await Get.find<AuthController>().isUserLoggedIn()) {
      final bool result = await _addToCartController.getProductToCart(
        widget.productid,
      );
      if (result) {
        showSnackBarMessenger(context, 'Added to cart');
      } else {
        showSnackBarMessenger(context, _addToCartController.errorMessage!);
      }
    } else {
      Navigator.pushNamed(context, LoginScreen.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Details')),
      body: SingleChildScrollView(
        child: GetBuilder<ProductDetailsController>(
          builder: (controller) => Column(
            children: [
              ProductImageSlider(image: controller.productDetails.photos),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              controller.productDetails.title,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        IncDecButton(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('⭐'),
                        Text('4.8', style: TextStyle(color: Colors.black45)),
                        TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            padding: WidgetStateProperty.all(EdgeInsets.zero),
                          ),
                          child: Text('Reviews'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Card(
                            color: AppColor.themeColor,

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(2),
                            ),
                            child: Icon(
                              Icons.favorite_border_outlined,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Color',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizePicker(
                      colors: controller.productDetails.colors,
                      onSelected: (p0) {},
                    ),
                    Text(
                      'Size',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizePicker(
                      colors: controller.productDetails.sizes,
                      onSelected: (String value) {},
                    ),
                    Text(
                      'Description',
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge!.copyWith(color: Colors.black),
                    ),
                    SizedBox(
                      height: 250,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(
                          controller.productDetails.description,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),

                    buildPriceAndAddToCart(controller.productDetails),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPriceAndAddToCart(ProductDetailsModel price) {
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
                  price.currentPrice.toString(),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColor.themeColor,
                  ),
                ),
              ],
            ),
            GetBuilder(
              init: _addToCartController,
              builder: (controller) => Visibility(
                visible: controller.inProgress == false,
                replacement: CenteredCircularProgressIndicator(),
                child: ElevatedButton(
                  onPressed: _onTapAddToCartButton,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(8),
                    ),
                  ),
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnTapColorPicker extends StatelessWidget {
  const OnTapColorPicker({
    super.key,
    required this.ontap,
    required this.color,
    this.icon,
  });
  final VoidCallback ontap;
  final IconData? icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}

class SizePicker extends StatefulWidget {
  const SizePicker({super.key, required this.colors, required this.onSelected});
  final List<String> colors;
  final Function(String) onSelected;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  String? selectedColor;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        for (String color in widget.colors)
          GestureDetector(
            onTap: () {
              selectedColor = color;
              setState(() {});
              widget.onSelected(selectedColor!);
            },
            child: Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
                color: selectedColor == color ? AppColor.themeColor : null,
              ),
              child: Text('Color'),
            ),
          ),
      ],
    );
  }
}
