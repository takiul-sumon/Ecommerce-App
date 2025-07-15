import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/app/app_color.dart';
import 'package:ecommerce_app/features/home/data/models/slider_model.dart';
import 'package:flutter/material.dart';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({super.key, required this.slider});
  final List<SliderModel> slider;
  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  final ValueNotifier<int> currentSlider = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            height: 150.0,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              currentSlider.value = index;
            },
          ),
          items: widget.slider.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(i.photoUrl),
                      fit: BoxFit.fill,
                    ),
                    color: AppColor.themeColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 8),
        ValueListenableBuilder(
          valueListenable: currentSlider,
          builder: (context, index, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < widget.slider.length; i++)
                  Container(
                    height: 12,
                    width: 12,
                    margin: EdgeInsets.only(left: 2),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(8),
                      color: currentSlider.value == i
                          ? AppColor.themeColor
                          : null,
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
