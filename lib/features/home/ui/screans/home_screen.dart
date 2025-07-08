import 'dart:ui';

import 'package:ecommerce_app/app/app_color.dart';
import 'package:ecommerce_app/app/assets_paths.dart';
import 'package:ecommerce_app/features/Product/ui/screans/prodcut_list_screens.dart';
import 'package:ecommerce_app/features/Product/ui/screans/product_details.dart';
import 'package:ecommerce_app/features/commons/ui/controller/main_bottom_nav_controller.dart';
import 'package:ecommerce_app/features/auth/ui/widgets/Circular_App_Button.dart';
import 'package:ecommerce_app/features/auth/ui/widgets/Carousel_Slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/instance_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchProductTEController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              TextField(
                textInputAction: TextInputAction.search,
                onSubmitted: (value) {},
                controller: searchProductTEController,
                decoration: InputDecoration(
                  fillColor: Colors.black12,
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search',
                  filled: true,
                  border: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
              ),
              SizedBox(height: 10),
              CarouselSliderWidget(),
              SizedBox(height: 10),
              CatagoriesSeeAll(
                title: 'All Catagories',
                onSeeAll: () {
                  Get.find<MainBottomNavScreenController>().moveToCategory();
                },
                buttonText: 'See All',
              ),
              SizedBox(
                height: 140,
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: CatagoryWiseProduct(
                        icon: Icons.computer,
                        prodcutTitle: 'Electronics',
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              CatagoriesSeeAll(
                title: 'Popular',
                onSeeAll: () {},
                buttonText: 'See All',
              ),
              getPopularProduct(),
              SizedBox(height: 10),
              CatagoriesSeeAll(
                title: 'Special',
                onSeeAll: () {},
                buttonText: 'See All',
              ),
              getSpecialProduct(),
              SizedBox(height: 10),
              CatagoriesSeeAll(
                title: 'New',
                onSeeAll: () {},
                buttonText: 'See All',
              ),
              getNewProduct(),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}

Widget getPopularProduct() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      spacing: 10,
      children: [1, 2, 3, 4].map((e) => ProductCard()).toList(),
    ),
  );
}

Widget getNewProduct() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      spacing: 10,
      children: [1, 2, 3, 4].map((e) => ProductCard()).toList(),
    ),
  );
}

Widget getSpecialProduct() {
  return SizedBox(
    height: 195,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return ProductCard();
      },
      separatorBuilder: (context, index) {
        return SizedBox(width: 10);
      },
      itemCount: 5,
    ),
  );
}

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductDetailsScreen.name,
          arguments: 'abcse',
        );
      },
      child: Container(
        width: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColor.themeColor.withOpacity(.01),
              offset: Offset(0.0, 0.1),
              blurRadius: 7,
            ),
          ],
        ),
        // height: 200,
        child: Column(
          children: [
            Container(
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                color: AppColor.themeColor.withOpacity(.1),
              ),
              padding: EdgeInsets.all(16),
              child: Image.asset(
                AssetPath.dummyNikeImage5,
                height: 80,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                'New Year Special Shoe 30',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$100', style: TextStyle(color: AppColor.themeColor)),
                    Text('⭐'),
                    Text('4.8', style: TextStyle(color: Colors.black45)),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}

AppBar buildAppBar() {
  return AppBar(
    title: SvgPicture.asset(AssetPath.navBarLogo),
    actions: [
      CircularAppBarButton(icon: Icon(Icons.person), ontap: () {}),
      CircularAppBarButton(icon: Icon(Icons.call), ontap: () {}),
      CircularAppBarButton(icon: Icon(Icons.notifications), ontap: () {}),
    ],
  );
}

class CatagoryWiseProduct extends StatelessWidget {
  const CatagoryWiseProduct({
    super.key,
    required this.icon,
    required this.prodcutTitle,
  });
  final IconData icon;
  final String prodcutTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductListScreen.name,
          arguments: 'catagory',
        );
      },
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: AppColor.themeColor.withValues(alpha: .1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(icon, size: 45, color: AppColor.themeColor),
          ),
          SizedBox(height: 5),
          Text(
            prodcutTitle,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColor.themeColor.withValues(alpha: .7),
            ),
          ),
        ],
      ),
    );
  }
}

class CatagoriesSeeAll extends StatelessWidget {
  const CatagoriesSeeAll({
    super.key,
    required this.title,
    required this.onSeeAll,
    required this.buttonText,
  });
  final String title;
  final VoidCallback onSeeAll;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        TextButton(
          onPressed: onSeeAll,
          style: ButtonStyle(),
          child: Text(buttonText),
        ),
      ],
    );
  }
}
