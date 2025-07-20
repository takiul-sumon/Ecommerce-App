import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/app/app_color.dart';
import 'package:flutter/material.dart';

class ProductImageSlider extends StatefulWidget {
  const ProductImageSlider({super.key, required this.image});
  final List<String> image;
  @override
  State<ProductImageSlider> createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  final ValueNotifier<int> currentSlider = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            height: 200.0,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              currentSlider.value = index;
            },
          ),
          items: widget.image.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    image: DecorationImage(image: NetworkImage(i)),
                  ),
                );
              },
            );
          }).toList(),
        ),
        // const SizedBox(height: 8),
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: ValueListenableBuilder(
            valueListenable: currentSlider,
            builder: (context, index, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < widget.image.length; i++)
                    Container(
                      height: 12,
                      width: 12,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(8),
                        color: currentSlider.value == i
                            ? AppColor.themeColor
                            : Colors.white,
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
