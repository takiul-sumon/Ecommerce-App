import 'package:ecommerce_app/app/app_color.dart';
import 'package:ecommerce_app/features/Product/ui/Widget/inc_dec_button.dart';
import 'package:ecommerce_app/features/Product/ui/Widget/product_image_slider.dart';
import 'package:ecommerce_app/features/home/ui/screans/home_screen.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productid});

  final String productid;
  static const String name = '/product-details';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    super.initState();
    ProductCard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Details')),
      body: Column(
        children: [
          ProductImageSlider(),
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
                          'Happy New Year Speical Deal \nSave 30%',
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
                Row(
                  spacing: 15,
                  children: [
                    OnTapColorPicker(color: Colors.black, ontap: () {}),
                    OnTapColorPicker(
                      color: Colors.cyan,
                      ontap: () {},
                      icon: Icons.check,
                    ),
                    OnTapColorPicker(color: Colors.grey.shade500, ontap: () {}),
                    OnTapColorPicker(color: Colors.brown, ontap: () {}),
                    OnTapColorPicker(color: Colors.black54, ontap: () {}),
                  ],
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
                  colors: ['L', 'M', 'XL', 'XXl'],
                  onSelected: (String value) {},
                ),
                Text(
                  'Description',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, ',
                  style: TextStyle(fontSize: 14),
                ),
                buildPriceAndAddToCart(),
              ],
            ),
          ),
        ],
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
                  '\$100',
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
              child: Text('Add to Cart', style: TextStyle(color: Colors.white)),
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
